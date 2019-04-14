/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.entity;

import com.baomidou.mybatisplus.annotations.TableField;

import java.time.LocalDateTime;

/**
 * null - 实体类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class Image {
    private String id;

    private String url;

    @TableField("create_time")
    private LocalDateTime createTime;

    @TableField("update_time")
    private LocalDateTime updateTime;

    /**
     * @return id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * @return url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }
}