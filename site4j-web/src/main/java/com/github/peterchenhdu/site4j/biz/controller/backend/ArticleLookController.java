/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.controller.backend;


import com.github.peterchenhdu.site4j.biz.dto.req.ArticleLookQueryDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.ArticleLookService;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * 查看文章浏览记录
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Api(value="文章查看记录", tags="网站数据")
@RestController
@RequestMapping("/admin/bizArticleLook")
public class ArticleLookController {

    @Autowired
    private ArticleLookService bizArticleLookService;

    @ApiOperation(value="路由到文章记录查看页面")
    @BusinessLog("进入文章浏览记录页")
    @GetMapping("")
    public ModelAndView bizArticleLook() {
        return ResultUtils.view("admin/statistic/article-look");
    }

    @ApiOperation(value="文章历史记录查询")
    @PostMapping("/query")
    public BasePagingResultDto list(ArticleLookQueryDto vo) {
        return new BasePagingResultDto(bizArticleLookService.query(vo));
    }
}
