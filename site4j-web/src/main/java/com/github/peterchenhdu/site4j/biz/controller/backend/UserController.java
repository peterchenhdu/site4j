/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.service.usermgt.SysUserService;
import com.github.peterchenhdu.site4j.biz.dto.req.UserConditionVO;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.PageResult;
import com.github.peterchenhdu.site4j.common.base.Response;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.enums.UserStatusEnum;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.util.PasswordUtils;
import com.github.peterchenhdu.site4j.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;

/**
 * 用户管理
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="用户管理", tags="权限管理")
@RestController
@RequestMapping("/admin/user")
public class UserController {
    @Autowired
    private SysUserService userService;

    @ApiOperation(value="路由到用户管理页面")
    @BusinessLog("进入用户列表页")
    @GetMapping("")
    public ModelAndView user() {
        return ResultUtils.view("admin/user/list");
    }

    @ApiOperation(value="查询用户列表.")
    @PostMapping("/query")
    public PageResult list(UserConditionVO vo) {
        PageInfo<UserDto> pageInfo = userService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }


    @ApiOperation(value="新增用户")
    @PostMapping(value = "/add")
    public Response add(UserDto user) {
        UserDto u = userService.getByUserName(user.getUsername());
        if (u != null) {
            return ResultUtils.error("该用户名[" + user.getUsername() + "]已存在！请更改用户名");
        }
        try {
            user.setPassword(PasswordUtils.encrypt(user.getPassword(), user.getUsername()));
            LocalDateTime now = LocalDateTime.now();
            user.setUpdateTime(now);
            user.setCreateTime(now);
            user.setId(UuidUtils.getUuid());
            user.setStatus(UserStatusEnum.NORMAL.getKey());
            userService.insert(user);
            return ResultUtils.success("成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("error");
        }
    }

    @ApiOperation(value="批量删除用户")
    @PostMapping(value = "/batchDelete")
    public Response batchDelete(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            userService.deleteById(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个用户");
    }

    @ApiOperation(value="单个删除用户")
    @PostMapping(value = "/delete")
    public Response delete(String id) {
        userService.deleteById(id);
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看单个用户信息")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.userService.selectById(id));
    }

    @ApiOperation(value="修改用户")
    @PostMapping("/update")
    public Response update(UserDto user) {
        try {
            userService.updateById(user);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("用户修改失败！");
        }
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

}
