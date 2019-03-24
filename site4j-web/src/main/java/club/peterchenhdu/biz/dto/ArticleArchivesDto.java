/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.BizArticleArchives;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
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
