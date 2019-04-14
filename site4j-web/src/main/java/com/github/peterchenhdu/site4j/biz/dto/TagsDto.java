/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizTags;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class TagsDto {
    private BizTags bizTags;

    public TagsDto() {
        this.bizTags = new BizTags();
    }

    public TagsDto(BizTags bizTags) {
        this.bizTags = bizTags;
    }

    @JsonIgnore
    public BizTags getBizTags() {
        return this.bizTags;
    }

    public String getId() {
        return this.bizTags.getId();
    }

    public void setId(String id) {
        this.bizTags.setId(id);
    }

    public String getName() {
        return this.bizTags.getName();
    }

    public void setName(String name) {
        this.bizTags.setName(name);
    }

    public String getDescription() {
        return this.bizTags.getDescription();
    }

    public void setDescription(String description) {
        this.bizTags.setDescription(description);
    }

    public LocalDateTime getCreateTime() {
        return this.bizTags.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizTags.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.bizTags.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizTags.setUpdateTime(updateTime);
    }

}

