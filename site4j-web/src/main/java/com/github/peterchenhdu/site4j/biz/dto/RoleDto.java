/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class RoleDto {
    private SysRole sysRole;

    public RoleDto() {
        this.sysRole = new SysRole();
    }

    public RoleDto(SysRole sysRole) {
        this.sysRole = sysRole;
    }

    @JsonIgnore
    public SysRole getSysRole() {
        return this.sysRole;
    }

    public String getId() {
        return this.sysRole.getId();
    }

    public void setId(String id) {
        this.sysRole.setId(id);
    }

    public String getName() {
        return this.sysRole.getName();
    }

    public void setName(String name) {
        this.sysRole.setName(name);
    }


    public String getDescription() {
        return this.sysRole.getDescription();
    }

    public void setDescription(String description) {
        this.sysRole.setDescription(description);
    }

    public boolean isAvailable() {
        Boolean value = this.sysRole.getAvailable();
        return value != null ? value : false;
    }

    public void setAvailable(boolean available) {
        this.sysRole.setAvailable(available);
    }

    public LocalDateTime getCreateTime() {
        return this.sysRole.getCreateTime();
    }

    public void setCreateTime(LocalDateTime regTime) {
        this.sysRole.setCreateTime(regTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.sysRole.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.sysRole.setUpdateTime(updateTime);
    }

}

