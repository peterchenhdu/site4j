/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizTags;
import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.enums.ArticleStatusEnum;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ArticleDto extends BizArticle{
    List<BizTags> tags;
    BizType bizType;
    private Integer lookCount;
    private Integer commentCount;
    private Integer loveCount;
    public ArticleStatusEnum getStatusEnum() {
        return ArticleStatusEnum.get(this.getStatus());
    }
    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public Integer getLoveCount() {
        return loveCount;
    }

    public void setLoveCount(Integer loveCount) {
        this.loveCount = loveCount;
    }

    public Integer getLookCount() {
        return lookCount;
    }

    public void setLookCount(Integer lookCount) {
        this.lookCount = lookCount;
    }
    public List<BizTags> getTags() {
        return tags;
    }

    public void setTags(List<BizTags> tags) {
        this.tags = tags;
    }

    public BizType getBizType() {
        return bizType;
    }

    public void setBizType(BizType bizType) {
        this.bizType = bizType;
    }
}

