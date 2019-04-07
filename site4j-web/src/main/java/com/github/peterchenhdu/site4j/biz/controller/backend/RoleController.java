/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleResourcesService;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.core.shiro.ShiroService;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleConditionVO;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 系统角色管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="角色管理", tags="权限管理")
@RestController
@RequestMapping("/admin/role")
public class RoleController {
    @Autowired
    private SysRoleService roleService;
    @Autowired
    private SysRoleResourcesService roleResourcesService;
    @Autowired
    private ShiroService shiroService;

    @ApiOperation(value="路由到角色管理页面")
    @BusinessLog("进入角色列表页")
    @GetMapping("")
    public ModelAndView roles() {
        return ResultUtils.view("admin/role/list");
    }

    @ApiOperation(value="查看所有角色")
    @PostMapping("/query")
    public BasePagingResultDto getAll(RoleConditionVO vo) {
        PageInfoDto<SysRole> pageInfo = roleService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="分配角色资源")
    @PostMapping("/allotResource")
    public BaseResponse saveRoleResources(String roleId, String resourcesId) {
        if (StringUtils.isEmpty(roleId)) {
            return ResultUtils.error("error");
        }
        roleResourcesService.addRoleResources(roleId, resourcesId);
        // 重新加载所有拥有roleId的用户的权限信息
        shiroService.reloadAuthorizingByRoleId(roleId);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="新增角色")
    @PostMapping(value = "/add")
    public BaseResponse add(RoleDto role) {
        roleService.insert(role);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="批量删除角色")
    @PostMapping(value = "/batchDelete")
    public BaseResponse remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            roleService.removeByPrimaryKey(id);
            roleResourcesService.removeByRoleId(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个角色");
    }

    @ApiOperation(value="删除单个角色")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        roleService.removeByPrimaryKey(id);
        roleResourcesService.removeByRoleId(id);
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看单个角色")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.roleService.getByPrimaryKey(id));
    }

    @ApiOperation(value="更新角色")
    @PostMapping("/update")
    public BaseResponse edit(RoleDto role) {
        try {
            roleService.updateSelective(role);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("角色修改失败！");
        }
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

}
