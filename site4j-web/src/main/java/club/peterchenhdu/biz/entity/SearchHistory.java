/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.time.LocalDateTime;

/**
 *  - 实体类
 * @author PiChen
 * @since 2018-10-28 09:20:24
 */
@TableName("search_history")
public class SearchHistory {
    @TableId
    private String id;

    /**
     * 关键字
     */
    @TableField("key_word")
    private String keyWord;

    /**
     * 已登录用户ID
     */
    @TableField("user_id")
    private String userId;

    /**
     * 用户IP
     */
    @TableField("user_ip")
    private String userIp;

    /**
     * 浏览时间
     */
    @TableField("search_time")
    private LocalDateTime searchTime;

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
     * 获取已登录用户ID
     *
     * @return user_id - 已登录用户ID
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置已登录用户ID
     *
     * @param userId 已登录用户ID
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取用户IP
     *
     * @return user_ip - 用户IP
     */
    public String getUserIp() {
        return userIp;
    }

    /**
     * 设置用户IP
     *
     * @param userIp 用户IP
     */
    public void setUserIp(String userIp) {
        this.userIp = userIp == null ? null : userIp.trim();
    }

    /**
     * 获取浏览时间
     *
     * @return search_time - 浏览时间
     */
    public LocalDateTime getSearchTime() {
        return searchTime;
    }

    /**
     * 设置浏览时间
     *
     * @param searchTime 浏览时间
     */
    public void setSearchTime(LocalDateTime searchTime) {
        this.searchTime = searchTime;
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