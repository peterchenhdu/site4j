/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 评论详情，用于页面传输
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizCommentDto {
    @JsonIgnore
    BizCommentDto parentDTO;
    private String id;
    @JsonIgnore
    private LocalDateTime createTime;
    private String sid;
    private String pid;
    private String nickname;
    private String avatar;
    private String url;
    private String address;
    private String os;
    private String osShortName;
    private String browser;
    private String browserShortName;
    private String content;
    private Integer support;
    private Integer oppose;

    @JsonIgnore
    private String userId;

    public boolean isAdmin() {
        return null != userId;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+8")
    public LocalDateTime getCreateTimeString() {
        return this.getCreateTime();
    }

    public BizCommentDto getParent() {
        return this.parentDTO;
    }
}
