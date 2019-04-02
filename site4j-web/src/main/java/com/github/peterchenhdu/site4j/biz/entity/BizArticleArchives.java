/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文章归档
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizArticleArchives {
    String id;
    private String title;
    private String original;
    private String datetime;
}
