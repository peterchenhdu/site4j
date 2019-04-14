/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文章归档
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizArticleArchives {
    String id;
    private String title;
    private String original;
    private String datetime;
}
