/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticleArchives;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ArticleArchivesDto {

    private BizArticleArchives bizArticleArchives;
    private List<ArticleDto> articleList;

    public ArticleArchivesDto(BizArticleArchives bizArticleArchives) {
        this.bizArticleArchives = bizArticleArchives;
    }

    public ArticleArchivesDto() {
    }

    @JsonIgnore
    public BizArticleArchives getBizArticleArchives() {
        return bizArticleArchives;
    }

    public List<ArticleDto> getArticleList() {
        return articleList;
    }

    public void setArticleList(List<ArticleDto> articleList) {
        this.articleList = articleList;
    }

    public String getId() {
        return this.bizArticleArchives.getId();
    }

    public void setId(String id) {
        this.bizArticleArchives.setId(id);
    }

    public String getTitle() {
        return this.bizArticleArchives.getTitle();
    }

    public void setTitle(String title) {
        this.bizArticleArchives.setTitle(title);
    }

    public String getOriginal() {
        return this.bizArticleArchives.getOriginal();
    }

    public void setOriginal(String original) {
        this.bizArticleArchives.setOriginal(original);
    }

    public String getDatetime() {
        return this.bizArticleArchives.getDatetime();
    }

    public void setDatetime(String datetime) {
        this.bizArticleArchives.setDatetime(datetime);
    }

    public String getDay() {
        String time = getDatetime();
        return time.substring(time.lastIndexOf("-") + 1);
    }
}
