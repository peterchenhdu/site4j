/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.common.util.ObjectUtils;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotNull;

/**
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ResourcesDto {

    private Resource parent;

    private String id;

    @NotNull
    private String name;
    @NotNull
    private String type;
    private String url;
    private String permission;
    private String parentId;

    private Integer sort;
    private String icon;

    public ResourcesDto(Resource resource) {
        if (ObjectUtils.isEmpty(resource)) {
            return;
        }
        BeanUtils.copyProperties(resource, this);
    }

    public Resource getParent() {
        return parent;
    }

    public void setParent(Resource parent) {
        this.parent = parent;
    }

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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}

