/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.ResourcesDto;
import club.peterchenhdu.biz.service.privilegemgt.SysResourcesService;
import club.peterchenhdu.biz.web.admin.shiro.ShiroService;
import club.peterchenhdu.biz.web.vo.ResourceConditionVO;
import club.peterchenhdu.common.annotation.BusinessLog;
import club.peterchenhdu.common.base.PageResult;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.enums.ResponseStatus;
import club.peterchenhdu.common.util.ObjectUtils;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.util.ResultUtils;
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


    @ApiOperation(value = "查询资源")
    @PostMapping("/query")
    public PageResult getAll(ResourceConditionVO vo) {
        PageInfo<ResourcesDto> pageInfo = resourcesService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value = "修改资源")
    @PostMapping("/resourcesWithSelected")
    public Response<List<Map<String, Object>>> resourcesWithSelected(String rid) {
        return ResultUtils.success(null, resourcesService.queryResourcesListWithSelected(rid));
    }

    @ApiOperation(value = "新增资源")
    @PostMapping(value = "/add")
    public Response add(@Valid ResourcesDto resources) {
        resourcesService.insert(resources);
        //更新权限
        updatePermission();
        return ResultUtils.success("成功");
    }


    /**
     * 重新加载权限
     */
    public synchronized void updatePermission() {
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

    @ApiOperation(value = "批量删除资源")
    @PostMapping(value = "/batchDelete")
    public Response batchDelete(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            resourcesService.removeByPrimaryKey(id);
        }

        //更新权限
        updatePermission();
        return ResultUtils.success("成功删除 [" + ids.length + "] 个资源");
    }


    @ApiOperation(value = "单个删除资源")
    @PostMapping(value = "/delete")
    public Response delete(String id) {
        resourcesService.removeByPrimaryKey(id);
        //更新权限
        updatePermission();
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value = "查看单个资源")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.resourcesService.getByPrimaryKey(id));
    }

    @ApiOperation(value = "修改资源")
    @PostMapping("/update")
    public Response update(ResourcesDto resources) {
        resourcesService.updateSelective(resources);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }
}
