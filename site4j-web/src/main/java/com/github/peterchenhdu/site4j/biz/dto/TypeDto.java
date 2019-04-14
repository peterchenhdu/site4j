/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class TypeDto {
    private BizType bizType;

    public TypeDto() {
        this.bizType = new BizType();
    }

    public TypeDto(BizType bizType) {
        this.bizType = bizType;
    }

    @JsonIgnore
    public BizType getBizType() {
        return this.bizType;
    }

    public String getId() {
        return this.bizType.getId();
    }

    public void setId(String id) {
        this.bizType.setId(id);
    }

    public String getPid() {
        return this.bizType.getPid();
    }

    public void setPid(String pid) {
        this.bizType.setPid(pid);
    }

    public String getName() {
        return this.bizType.getName();
    }

    public void setName(String name) {
        this.bizType.setName(name);
    }

    public String getDescription() {
        return this.bizType.getDescription();
    }

    public void setDescription(String description) {
        this.bizType.setDescription(description);
    }

    public Integer getSort() {
        return this.bizType.getSort();
    }

    public void setSort(Integer sort) {
        this.bizType.setSort(sort);
    }

    public boolean isAvailable() {
        Boolean value = this.bizType.getAvailable();
        return value != null ? value : false;
    }

    public void setAvailable(boolean available) {
        this.bizType.setAvailable(available);
    }

    public String getIcon() {
        return this.bizType.getIcon();
    }

    public void setIcon(String icon) {
        this.bizType.setIcon(icon);
    }

    public LocalDateTime getCreateTime() {
        return this.bizType.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizType.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.bizType.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizType.setUpdateTime(updateTime);
    }

    public BizType getParent() {
        return this.bizType.getParent();
    }

    public void setParent(BizType parent) {
        this.bizType.setParent(parent);
    }

    public List<BizType> getNodes() {
        return this.bizType.getNodes();
    }

    public void setNodes(List<BizType> nodes) {
        this.bizType.setNodes(nodes);
    }

}

