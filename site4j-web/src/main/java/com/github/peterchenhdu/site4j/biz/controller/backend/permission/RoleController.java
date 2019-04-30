/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend.permission;

import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleResourcesService;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import com.github.peterchenhdu.site4j.enums.RoleTypeEnum;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.Arrays;
import java.util.Collections;

/**
 * 系统角色管理
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Api(value="角色管理", tags="权限管理")
@RestController
@RequestMapping("/admin/role")
@Validated
public class RoleController {
    @Autowired
    private SysRoleService roleService;
    @Autowired
    private SysRoleResourcesService roleResourcesService;


    @ApiOperation(value="路由到角色管理页面")
    @BusinessLog("进入角色列表页")
    @GetMapping("")
    public ModelAndView roles(Model model) {

        model.addAttribute("roleTypeList", RoleTypeEnum.toList());
        return ResultUtils.view("admin/permission/role");
    }

    @ApiOperation(value="查看所有角色")
    @PostMapping("/query")
    public BasePagingResultDto getAll(RoleQueryDto vo) {
        PageInfoDto<SysRole> pageInfo = roleService.query(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="分配角色资源")
    @PostMapping("/allotResource")
    public BaseResponse saveRoleResources(@NotBlank(message="角色不能为空") String roleId,
                                          @NotBlank(message="资源不能为空") String resourcesId) {
        roleResourcesService.addRoleResources(roleId, resourcesId);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="新增角色")
    @PostMapping(value = "/add")
    public BaseResponse add(RoleDto role) {
        roleService.save(role);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="批量删除角色")
    @PostMapping(value = "/batchDelete")
    public BaseResponse remove(@NotEmpty(message="请至少选择一条记录") String[] ids) {
        roleService.delete(Arrays.asList(ids));
        return ResultUtils.success("成功删除 [" + ids.length + "] 个角色");
    }

    @ApiOperation(value="删除单个角色")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        roleService.delete(Collections.singletonList(id));
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看单个角色")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.roleService.queryById(id));
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
