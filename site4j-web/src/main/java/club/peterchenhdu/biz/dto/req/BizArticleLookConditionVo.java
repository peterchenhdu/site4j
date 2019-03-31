/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.dto.req;

import club.peterchenhdu.common.base.BaseCondition;
import club.peterchenhdu.biz.entity.BizArticleLook;
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
