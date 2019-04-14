/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;

import java.time.LocalDateTime;

/**
 *  - 实体类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class Dict {
    /**
     * 主键
     */
    @TableId
    private String id;

    /**
     * 类型
     */
    @TableField("dict_type")
    private String dictType;

    /**
     * key
     */
    @TableField("dict_key")
    private String dictKey;

    /**
     * 值
     */
    @TableField("dict_value")
    private String dictValue;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private LocalDateTime updateTime;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public String getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getDictType() {
        return dictType;
    }

    public void setDictType(String dictType) {
        this.dictType = dictType;
    }

    public String getDictKey() {
        return dictKey;
    }

    public void setDictKey(String dictKey) {
        this.dictKey = dictKey;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue;
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