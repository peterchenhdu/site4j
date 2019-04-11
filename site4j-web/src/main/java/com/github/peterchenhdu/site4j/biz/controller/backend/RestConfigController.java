/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
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
 * 系统配置
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="系统配置", tags="网站管理")
@RestController
@RequestMapping("/admin/config")
public class RestConfigController {
    @Autowired
    private SysConfigService sysConfigService;

    @ApiOperation(value="路由到系统配置页面")
    @BusinessLog("进入系统配置页")
    @GetMapping("")
    public ModelAndView config() {
        return ResultUtils.view("admin/config");
    }


    @ApiOperation(value="查看系统配置")
    @PostMapping("/get")
    public BaseResponse get() {
        return ResultUtils.success(null, sysConfigService.get());
    }

    @ApiOperation(value="修改系统配置")
    @PostMapping("/edit")
    public BaseResponse edit(ConfigDto config) {

        try {
            sysConfigService.update(config);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("系统配置修改失败");
        }
        return ResultUtils.success("系统配置修改成功");
    }

}
