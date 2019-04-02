/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.biz.entity.BizArticleLook;
import com.github.peterchenhdu.site4j.common.base.BaseCondition;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author PiChen
 * @since 2019/3/4
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizArticleLookConditionVo extends BaseCondition {
    private BizArticleLook bizArticleLook;
}
