/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.SysConfig;
import club.peterchenhdu.common.util.DateUtils;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ConfigDto implements Serializable{
    private SysConfig sysConfig;

    public ConfigDto() {
        this.sysConfig = new SysConfig();
    }

    public ConfigDto(SysConfig sysConfig) {
        this.sysConfig = sysConfig;
    }

    @JsonIgnore
    public SysConfig getSysConfig() {
        return this.sysConfig;
    }

    public String getId() {
        return this.sysConfig.getId();
    }

    public void setId(String id) {
        this.sysConfig.setId(id);
    }

    public String getHomeDesc() {
        return this.sysConfig.getHomeDesc();
    }

    public void setHomeDesc(String homeDesc) {
        this.sysConfig.setHomeDesc(homeDesc);
    }

    public String getHomeKeywords() {
        return this.sysConfig.getHomeKeywords();
    }

    public void setHomeKeywords(String homeKeywords) {
        this.sysConfig.setHomeKeywords(homeKeywords);
    }

    public String getDomain() {
        return this.sysConfig.getDomain();
    }

    public void setDomain(String domain) {
        this.sysConfig.setDomain(domain);
    }

    public String getCmsUrl() {
        return this.sysConfig.getCmsUrl();
    }

    public void setCmsUrl(String cmsUrl) {
        this.sysConfig.setCmsUrl(cmsUrl);
    }

    public String getSiteUrl() {
        return this.sysConfig.getSiteUrl();
    }

    public void setSiteUrl(String siteUrl) {
        this.sysConfig.setSiteUrl(siteUrl);
    }

    public String getSiteName() {
        return this.sysConfig.getSiteName();
    }

    public void setSiteName(String siteName) {
        this.sysConfig.setSiteName(siteName);
    }

    public String getSiteDesc() {
        return this.sysConfig.getSiteDesc();
    }

    public void setSiteDesc(String siteDesc) {
        this.sysConfig.setSiteDesc(siteDesc);
    }

    public String getSiteFavicon() {
        return this.sysConfig.getSiteFavicon();
    }

    public void setSiteFavicon(String siteFavicon) {
        this.sysConfig.setSiteFavicon(siteFavicon);
    }

    public String getStaticWebSite() {
        return this.sysConfig.getStaticWebSite();
    }

    public void setStaticWebSite(String staticWebSite) {
        this.sysConfig.setStaticWebSite(staticWebSite);
    }

    public String getAuthorName() {
        return this.sysConfig.getAuthorName();
    }

    public void setAuthorName(String authorName) {
        this.sysConfig.setAuthorName(authorName);
    }

    public String getAuthorEmail() {
        return this.sysConfig.getAuthorEmail();
    }

    public void setAuthorEmail(String authorEmail) {
        this.sysConfig.setAuthorEmail(authorEmail);
    }

    public String getWxCode() {
        return this.sysConfig.getWxCode();
    }

    public void setWxCode(String wxCode) {
        this.sysConfig.setWxCode(wxCode);
    }

    public String getQq() {
        return this.sysConfig.getQq();
    }

    public void setQq(String qq) {
        this.sysConfig.setQq(qq);
    }

    public String getWeibo() {
        return this.sysConfig.getWeibo();
    }

    public void setWeibo(String weibo) {
        this.sysConfig.setWeibo(weibo);
    }

    public String getGithub() {
        return this.sysConfig.getGithub();
    }

    public void setGithub(String github) {
        this.sysConfig.setGithub(github);
    }

    public boolean isMaintenance() {
        Boolean value = this.sysConfig.getMaintenance();
        return value != null ? value : false;
    }

    public void setMaintenance(boolean maintenance) {
        this.sysConfig.setMaintenance(maintenance);
    }

    @JsonFormat(timezone = "GMT+8", pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    public LocalDateTime getMaintenanceData() {
        return this.sysConfig.getMaintenanceData();
    }

    @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    public void setMaintenanceData(LocalDateTime maintenanceData) {
        this.sysConfig.setMaintenanceData(maintenanceData);
    }

    public boolean isComment() {
        Boolean value = this.sysConfig.getComment();
        return value != null ? value : false;
    }

    public void setComment(boolean comment) {
        this.sysConfig.setComment(comment);
    }

    public LocalDateTime getCreateTime() {
        return this.sysConfig.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.sysConfig.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.sysConfig.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.sysConfig.setUpdateTime(updateTime);
    }

    public String getQiuniuBasePath() {
        return this.sysConfig.getQiuniuBasePath();
    }

    public void setQiuniuBasePath(String qiuniuBasePath) {
        this.sysConfig.setQiuniuBasePath(qiuniuBasePath);
    }

    public String getQiniuAccessKey() {
        return this.sysConfig.getQiniuAccessKey();
    }

    public void setQiniuAccessKey(String qiniuAccessKey) {
        this.sysConfig.setQiniuAccessKey(qiniuAccessKey);
    }

    public String getQiniuSecretKey() {
        return this.sysConfig.getQiniuSecretKey();
    }

    public void setQiniuSecretKey(String qiniuSecretKey) {
        this.sysConfig.setQiniuSecretKey(qiniuSecretKey);
    }

    public String getQiniuBucketName() {
        return this.sysConfig.getQiniuBucketName();
    }

    public void setQiniuBucketName(String qiniuBucketName) {
        this.sysConfig.setQiniuBucketName(qiniuBucketName);
    }

    public String getBaiduPushToken() {
        return this.sysConfig.getBaiduPushToken();
    }

    public void setBaiduPushToken(String baiduPushToken) {
        this.sysConfig.setBaiduPushToken(baiduPushToken);
    }

    public String getWxPraiseCode() {
        return this.sysConfig.getWxPraiseCode();
    }

    public void setWxPraiseCode(String wxPraiseCode) {
        this.sysConfig.setWxPraiseCode(wxPraiseCode);
    }

    public String getZfbPraiseCode() {
        return this.sysConfig.getZfbPraiseCode();
    }

    public void setZfbPraiseCode(String zfbPraiseCode) {
        this.sysConfig.setZfbPraiseCode(zfbPraiseCode);
    }

    public String getBaiduApiAk() {
        return this.sysConfig.getBaiduApiAk();
    }

    public void setBaiduApiAk(String baiduApiAk) {
        this.sysConfig.setBaiduApiAk(baiduApiAk);
    }

}

