/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.entity;

import club.peterchenhdu.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
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
