/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.service.articlemgt;

import club.peterchenhdu.biz.entity.SearchHistory;

import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/27
 */
public interface ISearchHistoryService {

    List<SearchHistory> listRecent(Integer size);

    int save(SearchHistory searchHistory);
}
