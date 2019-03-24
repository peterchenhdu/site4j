/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.web.admin.controller;


import club.peterchenhdu.biz.service.articlemgt.BizArticleLookService;
import club.peterchenhdu.biz.web.vo.BizArticleLookConditionVo;
import club.peterchenhdu.common.annotation.BusinessLog;
import club.peterchenhdu.common.base.PageResult;
import club.peterchenhdu.config.property.FrontPageConfig;
import club.peterchenhdu.util.ResultUtils;
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
@Api(value="文章查看记录")
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
    public PageResult list(BizArticleLookConditionVo vo) {
        return new PageResult(bizArticleLookService.findPageBreakByCondition(vo));
    }
}
