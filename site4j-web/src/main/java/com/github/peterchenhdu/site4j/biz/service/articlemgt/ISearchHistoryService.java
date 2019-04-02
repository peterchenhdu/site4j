/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.articlemgt;

import com.github.peterchenhdu.site4j.biz.entity.SearchHistory;

import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/27
 */
public interface ISearchHistoryService {

    List<SearchHistory> listRecent(Integer size);

    int save(SearchHistory searchHistory);
}
