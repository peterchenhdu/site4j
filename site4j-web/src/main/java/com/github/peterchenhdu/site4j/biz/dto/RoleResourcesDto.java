/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysRoleResources;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class RoleResourcesDto {

    private SysRoleResources sysRoleResources;

    public RoleResourcesDto() {
        this.sysRoleResources = new SysRoleResources();
    }

    public RoleResourcesDto(SysRoleResources sysRoleResources) {
        this.sysRoleResources = sysRoleResources;
    }

    @JsonIgnore
    public SysRoleResources getSysRoleResources() {
        return this.sysRoleResources;
    }

    public String getRoleId() {
        return this.sysRoleResources.getRoleId();
    }

    public void setRoleId(String roleId) {
        this.sysRoleResources.setRoleId(roleId);
    }

    public String getResourcesId() {
        return this.sysRoleResources.getResourcesId();
    }

    public void setResourcesId(String resourcesId) {
        this.sysRoleResources.setResourcesId(resourcesId);
    }

    public LocalDateTime getCreateTime() {
        return this.sysRoleResources.getCreateTime();
    }

    public void setCreateTime(LocalDateTime regTime) {
        this.sysRoleResources.setCreateTime(regTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.sysRoleResources.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.sysRoleResources.setUpdateTime(updateTime);
    }

}
