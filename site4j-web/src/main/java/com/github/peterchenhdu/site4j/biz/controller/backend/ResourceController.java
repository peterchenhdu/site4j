/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.dto.view.ZTreeNodeDto;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysResourcesService;
import com.github.peterchenhdu.site4j.core.shiro.ShiroService;
import com.github.peterchenhdu.site4j.biz.dto.req.ResourceConditionVO;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 系统资源管理
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value = "资源管理", tags = "权限管理")
@RestController
@RequestMapping("/admin/resource")
@Validated
public class ResourceController {
    @Autowired
    private SysResourcesService resourcesService;
    @Autowired
    private ShiroService shiroService;
    @Autowired
    private ShiroFilterFactoryBean shirFilter;

    @ApiOperation(value = "路由到资源管理页面")
    @BusinessLog("进入资源列表页")
    @GetMapping("")
    public ModelAndView resources() {
        return ResultUtils.view("admin/resources/list");
    }



    @ApiOperation(value = "查询同一级别的资源列表")
    @PostMapping("/querySameLevelResource")
    public BaseResponse<List<ResourcesDto>> querySameLevelResource(String rid) {
        return ResultUtils.success(resourcesService.querySameLevelResource(rid));
    }

    @ApiOperation(value = "查询资源")
    @PostMapping("/query")
    public BasePagingResultDto getAll(ResourceConditionVO vo) {
        PageInfoDto<ResourcesDto> pageInfo = resourcesService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value = "查询资源树")
    @PostMapping("/queryResourceTree")
    public BaseResponse<List<ZTreeNodeDto>> queryResourceTree(String rid) {
        return ResultUtils.success(resourcesService.queryResourceTree(rid));
    }

    @ApiOperation(value = "新增资源")
    @PostMapping(value = "/add")
    public BaseResponse add(@Valid ResourcesDto resources) {
        resourcesService.insert(resources);
        //更新权限
        updatePermission();
        return ResultUtils.success("成功");
    }

    @ApiOperation(value = "修改资源排序")
    @PostMapping(value = "/updateSort")
    public BaseResponse updateSort(String rId, Boolean isUp) {
        resourcesService.updateSort(rId, isUp);
        return ResultUtils.success("成功");
    }


    @ApiOperation(value = "批量删除资源")
    @PostMapping(value = "/batchDelete")
    public BaseResponse batchDelete(@NotNull String[] ids) {
        resourcesService.deleteBatchIds(Arrays.asList(ids));
        //更新权限
        updatePermission();
        return ResultUtils.success("成功删除 [" + ids.length + "] 个资源");
    }


    @ApiOperation(value = "单个删除资源")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        resourcesService.removeByPrimaryKey(id);
        //更新权限
        updatePermission();
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value = "查看单个资源")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(this.resourcesService.getByPrimaryKey(id));
    }

    @ApiOperation(value = "修改资源")
    @PostMapping("/update")
    public BaseResponse update(ResourcesDto resources) {
        resourcesService.updateSelective(resources);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    /**
     * 重新加载权限
     */
    private synchronized void updatePermission() {
        AbstractShiroFilter shiroFilter;
        try {
            shiroFilter = (AbstractShiroFilter) shirFilter.getObject();
        } catch (Exception e) {
            throw new RuntimeException("get ShiroFilter from shiroFilterFactoryBean error!");
        }

        if (ObjectUtils.isEmpty(shiroFilter)) {
            throw new RuntimeException("get ShiroFilter from shiroFilterFactoryBean error!");
        }

        PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter.getFilterChainResolver();
        DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();

        // 清空老的权限控制
        manager.getFilterChains().clear();

        shirFilter.getFilterChainDefinitionMap().clear();
        shirFilter.setFilterChainDefinitionMap(shiroService.loadFilterChainDefinitions());

        // 重新构建生成
        Map<String, String> chains = shirFilter.getFilterChainDefinitionMap();
        chains.keySet().forEach(key -> manager.createChain(key, chains.get(key).trim().replace(" ", "")));

    }
}
