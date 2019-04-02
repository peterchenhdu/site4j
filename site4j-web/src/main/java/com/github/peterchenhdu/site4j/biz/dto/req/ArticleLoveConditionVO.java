/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.biz.dto.ArticleLoveDto;
import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
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
public class ArticleLoveConditionVO extends BasePagingQueryDto {
    private ArticleLoveDto articleLove;
}

