/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysTemplate;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class TemplateDto {
    private SysTemplate sysTemplate;

    public TemplateDto() {
        this.sysTemplate = new SysTemplate();
    }

    public TemplateDto(SysTemplate sysTemplate) {
        this.sysTemplate = sysTemplate;
    }

    @JsonIgnore
    public SysTemplate getSysTemplate() {
        return this.sysTemplate;
    }

    public String getId() {
        return this.sysTemplate.getId();
    }

    public void setId(String id) {
        this.sysTemplate.setId(id);
    }

    public String getRefKey() {
        return this.sysTemplate.getRefKey();
    }

    public void setRefKey(String refKey) {
        this.sysTemplate.setRefKey(refKey);
    }

    public String getRefValue() {
        return this.sysTemplate.getRefValue();
    }

    public void setRefValue(String refValue) {
        this.sysTemplate.setRefValue(refValue);
    }

    public LocalDateTime getCreateTime() {
        return this.sysTemplate.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.sysTemplate.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.sysTemplate.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.sysTemplate.setUpdateTime(updateTime);
    }

}

