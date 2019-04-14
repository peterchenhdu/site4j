/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.articlemgt;

import com.github.peterchenhdu.site4j.biz.entity.SearchHistory;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface ISearchHistoryService {

    List<SearchHistory> listRecent(Integer size);

    int save(SearchHistory searchHistory);
}
