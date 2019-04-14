/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class UserConditionVO extends BasePagingQueryDto {
    private UserDto user;
}
