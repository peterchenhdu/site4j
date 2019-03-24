/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.BizTags;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
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

