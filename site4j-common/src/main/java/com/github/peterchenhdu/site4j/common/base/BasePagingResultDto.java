/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.base;

import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;

import java.util.List;

/**
 * bootstrap table用到的返回json格式
 * <p>
 * Created by chenpi on 2018/04/16.
 */
public class BasePagingResultDto {
    private Long total;
    private List rows;

    public BasePagingResultDto(Long total, List rows) {
        this.total = total;
        this.rows = rows;
    }

    public BasePagingResultDto(PageInfoDto pageInfo) {
        this.total = pageInfo.getTotal();
        this.rows = pageInfo.getList();
    }

    public BasePagingResultDto() {
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
