/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.base;

/**
 * 基类 - 分页查询条件DTO
 * <p>
 * Created by chenpi on 2018/04/16.
 */
public class BasePagingQueryDto {
    private int pageNumber = 1;
    private int pageSize = 10;

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
