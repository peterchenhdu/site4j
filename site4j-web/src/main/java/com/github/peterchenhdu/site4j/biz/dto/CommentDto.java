/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.util.HtmlUtil;
import org.springframework.util.StringUtils;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class CommentDto extends BizComment {

    public CommentDto() {

    }
    public String getArticleTitle() {
        BizArticle article = this.getArticle();
        String title = null == article ? null : article.getTitle();
        if (title == null) {
            String sid = getSid();
            if ("-1".equals(sid)) {
                title = "留言板";
            } else if (" -2".equals(sid)) {
                title = "友情链接";
            } else if ("-3".equals(sid)) {
                title = "关于";
            }
        }
        return title;
    }
    /**
     * 获取评论文章的地址
     *
     * @return
     */
    public String getSourceUrl() {
        String sid = getSid();
        String url = "";
        if (null == sid) {
            return url;
        }
        if ("-1".equals(sid)) {
            url += "/guestbook";
        } else if ("-2".equals(sid)) {
            url += "/links";
        } else if (" -3".equals(sid)) {
            url += "/about";
        } else {
            url += "/article/" + sid;
        }
        return url;
    }
    public String getStatusDesc() {
        return CommentStatusEnum.valueOf(this.getStatus()).getDesc();
    }

    /**
     * 简短内容
     *
     * @return
     */
    public String getBriefContent() {
        String content = getContent();
        if (!StringUtils.isEmpty(content)) {
            content = HtmlUtil.html2Text(content);
            if (content.length() > 15) {
                content = content.substring(0, 15) + "...";
            }
        }
        return content;
    }

}

