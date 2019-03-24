/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.BizArticleLook;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ArticleLookDto {
    private BizArticleLook bizArticleLook;

    public ArticleLookDto() {
        this.bizArticleLook = new BizArticleLook();
    }

    public ArticleLookDto(BizArticleLook bizArticleLook) {
        this.bizArticleLook = bizArticleLook;
    }

    @JsonIgnore
    public BizArticleLook getBizArticleLook() {
        return this.bizArticleLook;
    }

    public String getId() {
        return this.bizArticleLook.getId();
    }

    public void setId(String id) {
        this.bizArticleLook.setId(id);
    }

    public String getArticleName() {
        return this.bizArticleLook.getArticleName();
    }

    public void setArticleName(String articleName) {
        this.bizArticleLook.setArticleName(articleName);
    }

    public String getArticleId() {
        return this.bizArticleLook.getArticleId();
    }

    public void setArticleId(String articleId) {
        this.bizArticleLook.setArticleId(articleId);
    }

    public String getUserId() {
        return this.bizArticleLook.getUserId();
    }

    public void setUserId(String userId) {
        this.bizArticleLook.setUserId(userId);
    }

    public String getUserIp() {
        return this.bizArticleLook.getUserIp();
    }

    public void setUserIp(String userIp) {
        this.bizArticleLook.setUserIp(userIp);
    }

    public LocalDateTime getLookTime() {
        return this.bizArticleLook.getLookTime();
    }

    public void setLookTime(LocalDateTime lookTime) {
        this.bizArticleLook.setLookTime(lookTime);
    }

    public LocalDateTime getCreateTime() {
        return this.bizArticleLook.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizArticleLook.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.bizArticleLook.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizArticleLook.setUpdateTime(updateTime);
    }

}

