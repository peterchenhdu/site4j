/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.entity;

import club.peterchenhdu.common.base.BaseEntity;
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
public class BizArticleLove extends BaseEntity {
    private String articleId;
    private String userId;
    private String userIp;
    private LocalDateTime loveTime;
}
