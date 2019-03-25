/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.service.privilegemgt.SysResourcesService;
import club.peterchenhdu.biz.web.admin.shiro.ShiroService;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.enums.ModuleEnum;
import club.peterchenhdu.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * 系统资源管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="公共模块", tags="未分类")
@RestController
@RequestMapping("/admin/common")
public class CommonController {

    @Autowired
    private SysResourcesService resourcesService;
    @Autowired
    private ShiroService shiroService;
    @Autowired
    private ShiroFilterFactoryBean shirFilter;

    @ApiOperation(value="查看所有模块")
    @GetMapping("/allModules")
    public Response<List<Map<String, String>>> get( ) {
        return ResultUtils.success(null, ModuleEnum.toList());
    }

}
