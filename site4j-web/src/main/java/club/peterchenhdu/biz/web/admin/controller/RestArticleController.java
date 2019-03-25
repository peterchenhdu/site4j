/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.ArticleDto;
import club.peterchenhdu.biz.dto.ConfigDto;
import club.peterchenhdu.biz.service.articlemgt.BizArticleService;
import club.peterchenhdu.biz.service.sitemgt.SysConfigService;
import club.peterchenhdu.biz.web.vo.ArticleConditionVO;
import club.peterchenhdu.common.annotation.BusinessLog;
import club.peterchenhdu.common.base.PageResult;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.enums.BaiduPushTypeEnum;
import club.peterchenhdu.common.enums.ResponseStatus;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.util.BaiduPushUtil;
import club.peterchenhdu.util.ResultUtils;
import club.peterchenhdu.util.UrlBuildUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * 文章管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Slf4j
@Api(value="文章管理", tags="文章管理")
@RestController
@RequestMapping("/admin/article")
public class RestArticleController {
    @Autowired
    private BizArticleService articleService;
    @Autowired
    private SysConfigService configService;

    @ApiOperation(value="路由到文章管理页面")
    @BusinessLog("进入文章列表页")
    @GetMapping("")
    public ModelAndView articles() {
        return ResultUtils.view("admin/article/list");
    }

    @ApiOperation(value="路由到发布文章页面")
    @BusinessLog(value = "发表文章页[html]")
    @GetMapping("/publish")
    public ModelAndView publish() {
        return ResultUtils.view("admin/article/publish");
    }

    @ApiOperation(value="路由到发布MD文档文章页面")
    @BusinessLog(value = "发表文章页[markdown]")
    @GetMapping("/publishMd")
    public ModelAndView publishMd() {
        return ResultUtils.view("admin/article/publish-md");
    }

    @ApiOperation(value="路由到修改文章页面")
    @BusinessLog(value = "修改文章页[id={1}]")
    @GetMapping("/update/{id}")
    public ModelAndView edit(@PathVariable("id") String id, Model model) {
        model.addAttribute("id", id);
        ArticleDto article = articleService.getByPrimaryKey(id);
        if (article.getIsMarkdown()) {
            return ResultUtils.view("admin/article/publish-md");
        }
        return ResultUtils.view("admin/article/publish");
    }

    @ApiOperation(value="查询文章")
    @PostMapping("/list")
    public PageResult list(ArticleConditionVO vo) {
        PageInfo<ArticleDto> pageInfo = articleService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="删除文章")
    @PostMapping(value = "/remove")
    public Response remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            articleService.removeByPrimaryKey(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 篇文章");
    }

    @ApiOperation(value="查看文章")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.articleService.getByPrimaryKey(id));
    }

    @ApiOperation(value="新增文章")
    @PostMapping("/save")
    public Response edit(ArticleDto article, String[] tags, MultipartFile file) {
        articleService.publish(article, tags, file);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    @ApiOperation(value="修改文章")
    @PostMapping("/update/{type}")
    public Response update(@PathVariable("type") String type, String id) {
        articleService.updateTopOrRecommendedById(type, id);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    @ApiOperation(value="推送到百度")
    @PostMapping(value = "/pushToBaidu/{type}")
    public Response pushToBaidu(@PathVariable("type") BaiduPushTypeEnum type, String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        ConfigDto config = configService.get();
        String siteUrl = config.getSiteUrl();
        StringBuilder params = new StringBuilder();
        for (String id : ids) {
            params.append(siteUrl).append("/article/").append(id).append("\n");
        }
        // urls: 推送, update: 更新, del: 删除
        String url = UrlBuildUtil.getBaiduPushUrl(type.toString(), config.getSiteUrl(), config.getBaiduPushToken());
        /**
         * success	       	int	    成功推送的url条数
         * remain	       	int	    当天剩余的可推送url条数
         * not_same_site	array	由于不是本站url而未处理的url列表
         * not_valid	   	array	不合法的url列表
         */
        // {"remain":4999997,"success":1,"not_same_site":[],"not_valid":[]}
        /**
         * error	是	int	      错误码，与状态码相同
         * message	是	string	  错误描述
         */
        //{error":401,"message":"token is not valid"}
        String result = BaiduPushUtil.doPush(url, params.toString());
        log.info(result);
        if (result.contains("error")) {
            return ResultUtils.error(result);
        }
        return ResultUtils.success(null, result);
    }

    @ApiOperation(value="发布文章")
    @PostMapping(value = "/batchPublish")
    public Response batchPublish(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        articleService.batchUpdateStatus(ids, true);
        return ResultUtils.success("批量发布完成");
    }
}
