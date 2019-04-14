/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
import com.github.peterchenhdu.site4j.biz.dto.LinkDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class LinkConditionVO extends BasePagingQueryDto {
    private LinkDto link;
    private Boolean status;
    private Boolean homePageDisplay;

    public LinkConditionVO() {
    }

    public LinkConditionVO(Boolean status, Boolean homePageDisplay) {
        this.status = status;
        this.homePageDisplay = homePageDisplay;
    }
}

