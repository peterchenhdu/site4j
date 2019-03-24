/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.vo;

import club.peterchenhdu.common.base.BaseCondition;
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
public class CommentConditionVO extends BaseCondition {
    private String userId;
    private String sid;
    private String pid;
    private String qq;
    private String email;
    private String url;
    private String status;
}

