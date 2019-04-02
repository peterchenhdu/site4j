/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.entity;


import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.time.LocalDateTime;

/**
 *  - 实体类
 * @author PiChen
 * @since 2018-10-28 09:27:22
 */
@TableName("search_count")
public class SearchCount {
    @TableId
    private String id;

    /**
     * 关键字
     */
    @TableField("key_word")
    private String keyWord;

    /**
     * 搜索次数
     */
    private Long count;

    /**
     * 添加时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
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
        this.id = id;
    }

    /**
     * 获取关键字
     *
     * @return key_word - 关键字
     */
    public String getKeyWord() {
        return keyWord;
    }

    /**
     * 设置关键字
     *
     * @param keyWord 关键字
     */
    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord == null ? null : keyWord.trim();
    }

    /**
     * 获取搜索次数
     *
     * @return count - 搜索次数
     */
    public Long getCount() {
        return count;
    }

    /**
     * 设置搜索次数
     *
     * @param count 搜索次数
     */
    public void setCount(Long count) {
        this.count = count;
    }

    /**
     * 获取添加时间
     *
     * @return create_time - 添加时间
     */
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    /**
     * 设置添加时间
     *
     * @param createTime 添加时间
     */
    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public LocalDateTime getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(LocalDateTime updateTime) {
        this.updateTime = updateTime;
    }
}