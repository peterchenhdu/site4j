/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticleTags;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
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

