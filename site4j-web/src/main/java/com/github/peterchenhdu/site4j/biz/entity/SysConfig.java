/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import com.github.peterchenhdu.site4j.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysConfig extends BaseEntity {
    private String homeDesc;
    private String homeKeywords;
    private String domain;
    private String cmsUrl;
    private String siteUrl;
    private String siteName;
    private String siteDesc;
    private String siteFavicon;

    private String staticWebSite;
    private String authorName;
    private String authorEmail;

    private String wxCode;
    private String qq;
    private String weibo;
    private String github;
    private Boolean maintenance;
    private LocalDateTime maintenanceData;
    private Boolean comment;

    private String qiuniuBasePath;
    private String qiniuAccessKey;
    private String qiniuSecretKey;
    private String qiniuBucketName;


    private String baiduPushToken;
    /**
     * 赞赏码
     */
    private String wxPraiseCode;
    private String zfbPraiseCode;
    /**
     * 百度api授权AK(获取地址：http://lbsyun.baidu.com/apiconsole/key)
     * 调用百度的api时必须
     */
    private String baiduApiAk;
}
