/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * 文章浏览记录查询
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ArticleLookQueryDto extends BasePagingQueryDto {
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime lookTimeFrom;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime lookTimeTo;

    public LocalDateTime getLookTimeFrom() {
        return lookTimeFrom;
    }

    public void setLookTimeFrom(LocalDateTime lookTimeFrom) {
        this.lookTimeFrom = lookTimeFrom;
    }

    public LocalDateTime getLookTimeTo() {
        return lookTimeTo;
    }

    public void setLookTimeTo(LocalDateTime lookTimeTo) {
        this.lookTimeTo = lookTimeTo;
    }
}
