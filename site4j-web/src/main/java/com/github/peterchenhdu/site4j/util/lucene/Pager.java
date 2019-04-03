/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util.lucene;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Pager<T> implements Serializable {

    private static final long serialVersionUID = 1L;

    private int pageSize = 10;

    private int totalCount;

    private int totalPage;

    private int currentPage = 1;

    private List<T> dataList;

    private Map<String, Object> info = new HashMap<String, Object>();

    public Pager() {

    }

    public Pager(int pageSize, int totalCount, int totalPage, int currentPage,
                 List<T> dataList) {
        super();
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.dataList = dataList;
    }

    public Pager(int pageSize, int totalCount, int currentPage, List<T> dataList) {
        super();
        this.pageSize = pageSize;
        this.totalCount = totalCount;
        this.currentPage = currentPage;
        this.dataList = dataList;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        int count = totalCount / pageSize;
        return totalCount % pageSize == 0 ? count : count + 1;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }

    public void addInfo(String key, Object value) {
        info.put(key, value);
    }
}
