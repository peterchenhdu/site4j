/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysLink;
import com.github.peterchenhdu.site4j.enums.LinkSourceEnum;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Length;

import org.springframework.util.StringUtils;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class LinkDto {
    private SysLink sysLink;

    public LinkDto() {
        this.sysLink = new SysLink();
    }

    public LinkDto(SysLink sysLink) {
        this.sysLink = sysLink;
    }

    @JsonIgnore
    public SysLink getSysLink() {
        return this.sysLink;
    }

    public String getId() {
        return sysLink.getId();
    }

    public void setId(String id) {
        sysLink.setId(id);
    }

    @NotEmpty(message = "站点地址不能为空")
    @Pattern(regexp = "(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]", message = "不合法的地址")
    public String getUrl() {
        return this.sysLink.getUrl();
    }

    public void setUrl(String url) {
        this.sysLink.setUrl(url);
    }

    @NotEmpty(message = "站点名称不能为空")
    @Length(max = 15, min = 1, message = "站点名称长度建议保持在15个字符以内")
    public String getName() {
        return this.sysLink.getName();
    }

    public void setName(String name) {
        this.sysLink.setName(name);
    }

    @NotEmpty(message = "站点描述不能为空")
    @Length(max = 30, min = 1, message = "站点描述这么长，亲你是想参加作文比赛么？^_^")
    public String getDescription() {
        return this.sysLink.getDescription();
    }

    public void setDescription(String description) {
        this.sysLink.setDescription(description);
    }

    public String getEmail() {
        return this.sysLink.getEmail();
    }

    public void setEmail(String email) {
        this.sysLink.setEmail(email);
    }

    public String getQq() {
        return this.sysLink.getQq();
    }

    public void setQq(String qq) {
        this.sysLink.setQq(qq);
    }

    public String getFavicon() {
        return this.sysLink.getFavicon();
    }

    public void setFavicon(String favicon) {
        this.sysLink.setFavicon(favicon);
    }

    public Boolean isStatus() {
        Boolean value = this.sysLink.getStatus();
        return value != null ? value : false;
    }

    public void setStatus(Boolean status) {
        this.sysLink.setStatus(status);
    }

    @JsonIgnore
    public LinkSourceEnum getSourceEnum() {
        if (StringUtils.isEmpty(getSource())) {
            return LinkSourceEnum.OTHER;
        }
        return LinkSourceEnum.valueOf(getSource());
    }

    public String getSource() {
        return this.sysLink.getSource();
    }

    public void setSource(LinkSourceEnum source) {
        if (null == source) {
            source = LinkSourceEnum.ADMIN;
        }
        this.sysLink.setSource(source.toString());
    }

    public void setSource(String source) {
        this.sysLink.setSource(source);
    }

    public Boolean isHomePageDisplay() {
        Boolean value = this.sysLink.getHomePageDisplay();
        return value != null ? value : false;
    }

    public void setHomePageDisplay(Boolean homePageDisplay) {
        this.sysLink.setHomePageDisplay(homePageDisplay);
    }


    public String getRemark() {
        return this.sysLink.getRemark();
    }

    public void setRemark(String remark) {
        this.sysLink.setRemark(remark);
    }

    public LocalDateTime getCreateTime() {
        return this.sysLink.getCreateTime();
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.sysLink.setCreateTime(createTime);
    }

    public LocalDateTime getUpdateTime() {
        return this.sysLink.getUpdateTime();
    }

    public void setUpdateTime(LocalDateTime updateTime) {
        this.sysLink.setUpdateTime(updateTime);
    }

}

