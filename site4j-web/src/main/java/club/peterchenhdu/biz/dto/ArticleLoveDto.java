/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.BizArticleLove;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
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

