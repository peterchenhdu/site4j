/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysUser;
import com.github.peterchenhdu.site4j.util.PasswordUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.util.StringUtils;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class UserDto extends SysUser {

    private String roleId;
    private String roleName;

    public UserDto(){

    }

    public UserDto(SysUser sysUser){
        super();
        BeanUtils.copyProperties(sysUser, this);
    }

    public UserDto(String loginName, String password) {
        super();
        setUsername(loginName);
        if (!StringUtils.isEmpty(password)) {
            try {
                setPassword(PasswordUtils.encrypt(password, loginName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
