/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleConditionVO;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
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
    public BasePagingResultDto list(ArticleConditionVO vo) {
        PageInfoDto<ArticleDto> pageInfo = articleService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="删除文章")
    @PostMapping(value = "/remove")
    public BaseResponse remove(String[] ids) {
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
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.articleService.getByPrimaryKey(id));
    }

    @ApiOperation(value="新增文章")
    @PostMapping("/save")
    public BaseResponse edit(ArticleDto article, String[] tags, MultipartFile file) {
        articleService.publish(article, tags, file);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    @ApiOperation(value="修改文章")
    @PostMapping("/update/{type}")
    public BaseResponse update(@PathVariable("type") String type, String id) {
        articleService.updateTopOrRecommendedById(type, id);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }


    @ApiOperation(value="发布文章")
    @PostMapping(value = "/batchPublish")
    public BaseResponse batchPublish(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        articleService.batchUpdateStatus(ids, true);
        return ResultUtils.success("批量发布完成");
    }
}
