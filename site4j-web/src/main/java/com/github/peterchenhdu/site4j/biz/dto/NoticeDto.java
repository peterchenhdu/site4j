/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysNotice;
import com.github.peterchenhdu.site4j.common.enums.NoticeStatusEnum;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class NoticeDto {
    private SysNotice sysNotice;

    public NoticeDto() {
        this.sysNotice = new SysNotice();
    }

    public NoticeDto(SysNotice sysNotice) {
        this.sysNotice = sysNotice;
    }

    @JsonIgnore
    public SysNotice getSysNotice() {
        return this.sysNotice;
    }

    public String getId() {
        return this.sysNotice.getId();
    }

    public void setId(String id) {
        this.sysNotice.setId(id);
    }

    public String getUserId() {
        return this.sysNotice.getUserId();
    }

    public void setUserId(String userId) {
        this.sysNotice.setUserId(userId);
    }

    public String getStatus() {
        return this.sysNotice.getStatus();
    }

    public NoticeStatusEnum getStatusEnum() {
        return NoticeStatusEnum.valueOf(this.sysNotice.getStatus());
    }

    public void setStatus(String status) {
        this.sysNotice.setStatus(status);
    }

    public String getTitle() {
        return this.sysNotice.getTitle();
    }

    public void setTitle(String title) {
        this.sysNotice.setTitle(title);
    }

    public String getContent() {
        return this.sysNotice.getContent();
    }

    public void setContent(String content) {
        this.sysNotice.setContent(content);
    }

    public LocalDateTime getCreateTime() {
        return this.sysNotice.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.sysNotice.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.sysNotice.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.sysNotice.setUpdateTime(updateTime);
    }

}

