/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.controller.backend;


import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleLookService;
import com.github.peterchenhdu.site4j.biz.dto.req.BizArticleLookConditionVo;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.config.property.FrontPageConfig;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author PiChen
 * @since 2019-03-04
 */
@Api(value="文章查看记录", tags="网站数据")
@RestController
@RequestMapping("/admin/bizArticleLook")
public class BizArticleLookController {

    @Autowired
    private BizArticleLookService bizArticleLookService;
    @Autowired
    private FrontPageConfig frontPageConfig;

    @ApiOperation(value="路由到文章记录查看页面")
    @BusinessLog("进入文章浏览记录页")
    @GetMapping("")
    public ModelAndView bizArticleLook(Model model) {
        model.addAttribute("module", frontPageConfig.getFrontModule("bizArticleLook"));
        return ResultUtils.view("admin/common-mgt");
    }

    @ApiOperation(value="文章历史记录查询")
    @PostMapping("/list")
    public BasePagingResultDto list(BizArticleLookConditionVo vo) {
        return new BasePagingResultDto(bizArticleLookService.findPageBreakByCondition(vo));
    }
}
