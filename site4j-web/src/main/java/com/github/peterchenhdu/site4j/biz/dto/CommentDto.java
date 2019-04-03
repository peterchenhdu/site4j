/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.util.HtmlUtil;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class CommentDto {
    private BizComment bizComment;

    public CommentDto() {
        this.bizComment = new BizComment();
    }

    public CommentDto(BizComment bizComment) {
        this.bizComment = bizComment;
    }

    @JsonIgnore
    public BizComment getBizComment() {
        return this.bizComment;
    }

    public String getId() {
        return this.bizComment.getId();
    }

    public void setId(String id) {
        this.bizComment.setId(id);
    }

    public String getSid() {
        return this.bizComment.getSid();
    }

    public void setSid(String sid) {
        this.bizComment.setSid(sid);
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

    public String getArticleTitle() {
        BizArticle article = this.getArticle();
        String title = null == article ? null : article.getTitle();
        if (title == null) {
            String sid = getSid();
            if ("-1".equals(sid)) {
                title = "留言板 | 张亚东博客";
            } else if (" -2".equals(sid)) {
                title = "友情链接 | 张亚东博客";
            } else if ("-3".equals(sid)) {
                title = "关于 | 张亚东博客";
            }
        }
        return title;
    }

    public String getUserId() {
        return this.bizComment.getUserId();
    }

    public void setUserId(String userId) {
        this.bizComment.setUserId(userId);
    }

    public String getPid() {
        return this.bizComment.getPid();
    }

    public void setPid(String pid) {
        this.bizComment.setPid(pid);
    }

    public String getQq() {
        return this.bizComment.getQq();
    }

    public void setQq(String qq) {
        this.bizComment.setQq(qq);
    }

    public String getNickname() {
        return this.bizComment.getNickname();
    }

    public void setNickname(String nickname) {
        this.bizComment.setNickname(nickname);
    }

    public String getAvatar() {
        return this.bizComment.getAvatar();
    }

    public void setAvatar(String avatar) {
        this.bizComment.setAvatar(avatar);
    }

    public String getEmail() {
        return this.bizComment.getEmail();
    }

    public void setEmail(String email) {
        this.bizComment.setEmail(email);
    }

    public String getUrl() {
        return this.bizComment.getUrl();
    }

    public void setUrl(String url) {
        this.bizComment.setUrl(url);
    }

    public String getStatus() {
        return this.bizComment.getStatus();
    }

    public void setStatus(String status) {
        this.bizComment.setStatus(status);
    }

    public String getStatusDesc() {
        return CommentStatusEnum.valueOf(this.bizComment.getStatus()).getDesc();
    }

    public String getIp() {
        return this.bizComment.getIp();
    }

    public void setIp(String ip) {
        this.bizComment.setIp(ip);
    }

    public String getLng() {
        return this.bizComment.getLng();
    }

    public void setLng(String lng) {
        this.bizComment.setLng(lng);
    }

    public String getLat() {
        return this.bizComment.getLat();
    }

    public void setLat(String lat) {
        this.bizComment.setLat(lat);
    }

    public String getAddress() {
        return this.bizComment.getAddress();
    }

    public void setAddress(String address) {
        this.bizComment.setAddress(address);
    }

    public String getOs() {
        return this.bizComment.getOs();
    }

    public void setOs(String os) {
        this.bizComment.setOs(os);
    }

    public String getOsShortName() {
        return this.bizComment.getOsShortName();
    }

    public void setOsShortName(String osShortName) {
        this.bizComment.setOsShortName(osShortName);
    }

    public String getBrowser() {
        return this.bizComment.getBrowser();
    }

    public void setBrowser(String browser) {
        this.bizComment.setBrowser(browser);
    }

    public String getBrowserShortName() {
        return this.bizComment.getBrowserShortName();
    }

    public void setBrowserShortName(String browserShortName) {
        this.bizComment.setBrowserShortName(browserShortName);
    }

    public String getContent() {
        return this.bizComment.getContent();
    }

    public void setContent(String content) {
        this.bizComment.setContent(content);
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

    public String getRemark() {
        return this.bizComment.getRemark();
    }

    public void setRemark(String remark) {
        this.bizComment.setRemark(remark);
    }

    public Integer getSupport() {
        return this.bizComment.getSupport();
    }

    public void setSupport(Integer support) {
        this.bizComment.setSupport(support);
    }

    public Integer getOppose() {
        return this.bizComment.getOppose();
    }

    public void setOppose(Integer oppose) {
        this.bizComment.setOppose(oppose);
    }

    public LocalDateTime getCreateTime() {
        return this.bizComment.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.bizComment.setCreateTime(createTime);
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public LocalDateTime getCreateTimeString() {
        return this.bizComment.getCreateTime();
    }

    public LocalDateTime getUpdateTime() {
        return this.bizComment.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.bizComment.setUpdateTime(updateTime);
    }

    public BizComment getParent() {
        return this.bizComment.getParent();
    }

    public void setParent(BizComment parent) {
        this.bizComment.setParent(parent);
    }

    public BizArticle getArticle() {
        return this.bizComment.getArticle();
    }

    public void getArticle(BizArticle article) {
        this.bizComment.setArticle(article);
    }

}

