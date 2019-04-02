/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticleTags;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ArticleTagsDto {
    private static final long serialVersionUID = 1L;
    private BizArticleTags bizArticleTags;

    public ArticleTagsDto() {
        this.bizArticleTags = new BizArticleTags();
    }

    public ArticleTagsDto(BizArticleTags bizArticleTags) {
        this.bizArticleTags = bizArticleTags;
    }

    @JsonIgnore
    public BizArticleTags getBizArticleTags() {
        return this.bizArticleTags;
    }

    public String getId() {
        return this.bizArticleTags.getId();
    }

    public void setId(String id) {
        this.bizArticleTags.setId(id);
    }

    public String getTagId() {
        return this.bizArticleTags.getTagId();
    }

    public void setTagId(String tagId) {
        this.bizArticleTags.setTagId(tagId);
    }

    public String getArticleId() {
        return this.bizArticleTags.getArticleId();
    }

    public void setArticleId(String articleId) {
        this.bizArticleTags.setArticleId(articleId);
    }

    public LocalDateTime getCreateTime() {
        return this.bizArticleTags.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizArticleTags.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.bizArticleTags.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizArticleTags.setUpdateTime(updateTime);
    }

}

