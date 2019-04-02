/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ArticleConditionVO extends BasePagingQueryDto {
    private ArticleDto article;
    private String typeId;
    private String tagId;
    private Integer status;
    private Boolean top;
    private Boolean recommended;
    private Boolean original;
    private Boolean random;
    private List<String> tagIds;
    private String keywords;
}

