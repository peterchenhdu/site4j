/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticleLove;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ArticleLoveDto {
    private static final long serialVersionUID = 1L;
    private BizArticleLove bizArticleLove;

    public ArticleLoveDto() {
        this.bizArticleLove = new BizArticleLove();
    }

    public ArticleLoveDto(BizArticleLove bizArticleLove) {
        this.bizArticleLove = bizArticleLove;
    }

    @JsonIgnore
    public BizArticleLove getBizArticleLove() {
        return this.bizArticleLove;
    }

    public String getId() {
        return this.bizArticleLove.getId();
    }

    public void setId(String id) {
        this.bizArticleLove.setId(id);
    }

    public String getArticleId() {
        return this.bizArticleLove.getArticleId();
    }

    public void setArticleId(String articleId) {
        this.bizArticleLove.setArticleId(articleId);
    }

    public String getUserId() {
        return this.bizArticleLove.getUserId();
    }

    public void setUserId(String userId) {
        this.bizArticleLove.setUserId(userId);
    }

    public String getUserIp() {
        return this.bizArticleLove.getUserIp();
    }

    public void setUserIp(String userIp) {
        this.bizArticleLove.setUserIp(userIp);
    }

    public LocalDateTime getLoveTime() {
        return this.bizArticleLove.getLoveTime();
    }

    public void setLoveTime(LocalDateTime loveTime) {
        this.bizArticleLove.setLoveTime(loveTime);
    }

    public LocalDateTime getCreateTime() {
        return this.bizArticleLove.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizArticleLove.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.bizArticleLove.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizArticleLove.setUpdateTime(updateTime);
    }

}

