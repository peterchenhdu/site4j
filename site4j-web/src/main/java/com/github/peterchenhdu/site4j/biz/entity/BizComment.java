/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import com.github.peterchenhdu.site4j.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizComment extends BaseEntity {
    BizComment parent;
    BizArticle article;
    private String userId;
    private String sid;
    private String pid;
    private String qq;
    private String nickname;
    private String avatar;
    private String email;
    private String url;
    private String status;
    private String ip;
    private String lng;
    private String lat;
    private String address;
    private String os;
    private String osShortName;
    private String browser;
    private String browserShortName;
    private String content;
    private String remark;
    private Integer support;
    private Integer oppose;
}
