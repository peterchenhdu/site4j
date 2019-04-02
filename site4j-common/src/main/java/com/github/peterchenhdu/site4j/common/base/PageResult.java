/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.base;

import com.github.peterchenhdu.site4j.common.util.PageInfo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * bootstrap table用到的返回json格式
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PageResult {
    private Long total;
    private List rows;

    public PageResult(Long total, List rows) {
        this.total = total;
        this.rows = rows;
    }

    public PageResult(PageInfo pageInfo) {
        this.total = pageInfo.getTotal();
        this.rows = pageInfo.getList();
    }

    public PageResult() {
    }
}
