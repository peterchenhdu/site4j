/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import com.github.peterchenhdu.site4j.common.base.BaseEntity;
import com.google.common.base.Objects;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class Resource extends BaseEntity {
    private String name;
    private String type;
    private String url;
    private String permission;
    private String parentId;
    private Integer sort;
    private String icon;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }


    @Override
    public String toString() {
        return "Resource{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", url='" + url + '\'' +
                ", permission='" + permission + '\'' +
                ", parentId='" + parentId + '\'' +
                ", sort=" + sort +
                ", icon='" + icon + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Resource resource = (Resource) o;
        return Objects.equal(name, resource.name) &&
                Objects.equal(type, resource.type) &&
                Objects.equal(url, resource.url) &&
                Objects.equal(permission, resource.permission) &&
                Objects.equal(parentId, resource.parentId) &&
                Objects.equal(sort, resource.sort) &&
                Objects.equal(icon, resource.icon);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(name, type, url, permission, parentId, sort, icon);
    }
}
