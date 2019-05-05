/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend.article;

import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleQueryDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Arrays;

/**
 * 文章管理
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Api(value="文章管理", tags="文章管理")
@RestController
@RequestMapping("/admin/article")
@Validated
public class ArticleController {
    @Autowired
    private BizArticleService articleService;
    @Autowired
    private SysConfigService sysConfigService;


    @ApiOperation(value="路由到文章管理页面")
    @BusinessLog("进入文章列表页")
    @GetMapping("")
    public ModelAndView articles() {
        return ResultUtils.view("admin/article/article");
    }

    @ApiOperation(value="路由到发布文章页面")
    @BusinessLog(value = "发表文章页[html]")
    @GetMapping("/publish")
    public ModelAndView publish() {
        if("wangEditor".equals(sysConfigService.get().getDefaultArticleEditType())) {
            return ResultUtils.view("admin/article/publish");
        } else if("Markdown".equals(sysConfigService.get().getDefaultArticleEditType())) {
            return ResultUtils.view("admin/article/publish-md");
        } else {
            return ResultUtils.view("admin/article/publish-md");
        }

    }

    @ApiOperation(value="路由到修改文章页面")
    @BusinessLog(value = "修改文章页[id={1}]")
    @GetMapping("/update/{id}")
    public ModelAndView edit(@PathVariable("id") String id, Model model) {
        model.addAttribute("id", id);
        ArticleDto article = articleService.queryById(id);
        if (article.getMarkdown()) {
            return ResultUtils.view("admin/article/publish-md");
        }
        return ResultUtils.view("admin/article/publish");
    }

    @ApiOperation(value="查询文章")
    @PostMapping("/list")
    public BasePagingResultDto list(ArticleQueryDto vo) {
        PageInfoDto<ArticleDto> pageInfo = articleService.query(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value = "批量删除文章")
    @PostMapping(value = "/batchDelete")
    public BaseResponse batchDelete(@NotNull(message = "请至少选择一条记录") String[] ids) {
        articleService.deleteByIds(Arrays.asList(ids));
        return ResultUtils.success("成功删除[" + ids.length + "]条记录");
    }

    @ApiOperation(value = "删除单个文章")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        articleService.deleteById(id);
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看文章")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.articleService.queryById(id));
    }

    @ApiOperation(value="新增文章")
    @PostMapping("/save")
    public BaseResponse edit(@Valid ArticleDto article, @NotEmpty(message="标签不能为空") String[] tagIds, MultipartFile file) {
        articleService.publish(article, tagIds, file);
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
