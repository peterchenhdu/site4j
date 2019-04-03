/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.dto;

import java.util.List;
/**
 * 分页信息DTO
 * <p>
 * Created by chenpi on 2018/04/16.
 */
public class PageInfoDto<T>  {
    private int pageNum;
    private int pageSize;
    private int pages;
    private long total;
    private List<T> list;
    private int nextPage;
    public PageInfoDto(){

    }

    public PageInfoDto(long total, List<T> list) {
        this.total = total;
        this.list = list;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }



    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
