/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import com.github.peterchenhdu.site4j.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizArticleLook extends BaseEntity {
    private String articleId;
    private String userId;
    private String userIp;
    private LocalDateTime lookTime;
    private String articleName;
}
