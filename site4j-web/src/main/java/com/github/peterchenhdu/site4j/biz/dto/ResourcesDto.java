/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import org.springframework.beans.BeanUtils;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ResourcesDto {
    private String id;
    @NotNull
    private String name;
    @NotNull
    private String type;
    @NotNull(message = "test.name")
    private String url;
    private String permission;
    private String parentName;
    private String parentId;
    private Integer sort;
    @NotNull
    private String icon;

    /**
     * 菜单展开标记
     */
    private Boolean expand;

    public ResourcesDto() {
    }

    public ResourcesDto(Resource resource) {
        if (ObjectUtils.isEmpty(resource)) {
            return;
        }
        BeanUtils.copyProperties(resource, this);
    }
    private List<Resource> nodes;

    public List<Resource> getNodes() {
        return nodes;
    }

    public void setNodes(List<Resource> nodes) {
        this.nodes = nodes;
    }
    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
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

    public Boolean getExpand() {
        return expand;
    }

    public void setExpand(Boolean expand) {
        this.expand = expand;
    }
}

