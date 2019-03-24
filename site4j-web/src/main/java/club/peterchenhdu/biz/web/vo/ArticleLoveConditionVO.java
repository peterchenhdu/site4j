/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.vo;

import club.peterchenhdu.common.base.BaseCondition;
import club.peterchenhdu.biz.dto.ArticleLoveDto;
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
public class ArticleLoveConditionVO extends BaseCondition {
    private ArticleLoveDto articleLove;
}

