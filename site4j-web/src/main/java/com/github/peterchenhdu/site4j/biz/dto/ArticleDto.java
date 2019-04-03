/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizTags;
import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.enums.ArticleStatusEnum;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ArticleDto {
    private BizArticle bizArticle;
    public ArticleDto() {
        this.bizArticle = new BizArticle();
    }

    public ArticleDto(BizArticle bizArticle) {
        this.bizArticle = bizArticle;
    }

    public String getOriginalAuthor() {
        return this.bizArticle.getOriginalAuthor();
    }

    public void setOriginalAuthor(String originalAuthor) {
        this.bizArticle.setOriginalAuthor(originalAuthor);
    }

    public String getOriginalLink() {
        return this.bizArticle.getOriginalLink();
    }

    public void setOriginalLink(String originalLink) {
        this.bizArticle.setOriginalLink(originalLink);
    }

    @JsonIgnore
    public BizArticle getBizArticle() {
        return this.bizArticle;
    }

    public String getId() {
        return this.bizArticle.getId();
    }

    public void setId(String id) {
        this.bizArticle.setId(id);
    }

    public String getTitle() {
        return this.bizArticle.getTitle();
    }

    public void setTitle(String title) {
        this.bizArticle.setTitle(title);
    }

    public String getUserId() {
        return this.bizArticle.getUserId();
    }

    public void setUserId(String userId) {
        this.bizArticle.setUserId(userId);
    }

    public String getCoverImage() {
        return this.bizArticle.getCoverImage();
    }

    public void setCoverImage(String coverImage) {
        this.bizArticle.setCoverImage(coverImage);
    }

    public String getQrcodePath() {
        return this.bizArticle.getQrcodePath();
    }

    public void setQrcodePath(String qrcodePath) {
        this.bizArticle.setQrcodePath(qrcodePath);
    }

    public boolean getIsMarkdown() {
        Boolean value = this.bizArticle.getMarkdown();
        return null == value ? false : value;
    }

    public void setIsMarkdown(boolean isMarkdown) {
        this.bizArticle.setMarkdown(isMarkdown);
    }

    public String getContent() {
        return this.bizArticle.getContent();
    }

    public void setContent(String content) {
        this.bizArticle.setContent(content);
    }

    public String getContentMd() {
        return this.bizArticle.getContentMd();
    }

    public void setContentMd(String contentMd) {
        this.bizArticle.setContentMd(contentMd);
    }

    public boolean isTop() {
        Boolean value = this.bizArticle.getTop();
        return value != null ? value : false;
    }

    public void setTop(boolean top) {
        this.bizArticle.setTop(top);
    }


    public String getTypeId() {
        return this.bizArticle.getTypeId();
    }

    public void setTypeId(String type) {
        this.bizArticle.setTypeId(type);
    }

    public ArticleStatusEnum getStatusEnum() {
        return ArticleStatusEnum.get(this.bizArticle.getStatus());
    }

    public Integer getStatus() {
        return this.bizArticle.getStatus();
    }

    public void setStatus(Integer type) {
        this.bizArticle.setStatus(type);
    }

    public boolean getRecommended() {
        Boolean value = this.bizArticle.getRecommended();
        return value == null ? false : value;
    }

    public void setRecommended(Boolean value) {
        this.bizArticle.setRecommended(value);
    }

    public boolean isOriginal() {
        Boolean value = this.bizArticle.getOriginal();
        return value != null ? value : false;
    }

    public void setOriginal(boolean original) {
        this.bizArticle.setOriginal(original);
    }


    public String getDescription() {
        return this.bizArticle.getDescription();
    }

    public void setDescription(String description) {
        this.bizArticle.setDescription(description);
    }

    public String getKeywords() {
        return this.bizArticle.getKeywords();
    }

    public void setKeywords(String keywords) {
        this.bizArticle.setKeywords(keywords);
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    public LocalDateTime getCreateTime() {
        return this.bizArticle.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizArticle.setCreateTime(createTime);
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    public LocalDateTime getUpdateTime() {
        return this.bizArticle.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizArticle.setUpdateTime(updateTime);
    }

    public boolean isComment() {
        Boolean value = this.bizArticle.getComment();
        return value != null ? value : false;
    }

    public void setComment(boolean comment) {
        this.bizArticle.setComment(comment);
    }

    public List<BizTags> getTags() {
        return this.bizArticle.getTags();
    }

    public BizType getType() {
        return this.bizArticle.getBizType();
    }

    public int getLookCount() {
        Integer lookCount = this.bizArticle.getLookCount();
        return lookCount == null ? 0 : lookCount;
    }

    public int getCommentCount() {
        Integer commentCount = this.bizArticle.getCommentCount();
        return commentCount == null ? 0 : commentCount;
    }

    public int getLoveCount() {
        Integer loveCount = this.bizArticle.getLoveCount();
        return loveCount == null ? 0 : loveCount;
    }
}

