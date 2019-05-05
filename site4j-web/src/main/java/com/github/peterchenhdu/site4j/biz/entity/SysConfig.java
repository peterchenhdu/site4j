/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import com.github.peterchenhdu.site4j.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysConfig extends BaseEntity {
    private String domain;
    private String siteName;
    private String siteUrl;
    private String siteDesc;
    private String siteFavicon;
    private String staticWebSite;
    private String cmsUrl;

    private String homeDesc;
    private String homeKeywords;


    private String tencentCosBasePath;
    private String tencentCosAccessKey;
    private String tencentCosSecretKey;
    private String tencentCosRegionName;

    private String authorName;
    private String authorEmail;
    private String wxCode;
    private String qq;
    private String weibo;
    private String github;


    private Boolean comment;
    private Boolean maintenance;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime maintenanceData;
    private String defaultArticleEditType;





}
