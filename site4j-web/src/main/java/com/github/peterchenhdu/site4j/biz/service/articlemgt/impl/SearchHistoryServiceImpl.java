/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.github.peterchenhdu.site4j.biz.entity.SearchCount;
import com.github.peterchenhdu.site4j.biz.entity.SearchHistory;
import com.github.peterchenhdu.site4j.biz.mapper.SearchCountMapper;
import com.github.peterchenhdu.site4j.biz.mapper.SearchHistoryMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.ISearchHistoryService;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/27
 */
@Service
public class SearchHistoryServiceImpl implements ISearchHistoryService {

    @Autowired
    private SearchCountMapper searchCountMapper;

    @Autowired
    private SearchHistoryMapper searchHistoryMapper;

    @Override
    public List<SearchHistory> listRecent(Integer size) {

        Wrapper<SearchHistory> example = new EntityWrapper<>();
        example.orderBy("search_time", false);
        PageHelper.startPage(1, size);
        return searchHistoryMapper.selectList(example);
    }

    @Transactional
    @Override
    public int save(SearchHistory searchHistory) {

        Wrapper<SearchCount> example = new EntityWrapper<>();
        example.eq("key_word", searchHistory.getKeyWord());
        List<SearchCount> list = searchCountMapper.selectList(example);

        LocalDateTime date = LocalDateTime.now();
        if (ObjectUtils.isNotEmpty(list)) {
            SearchCount sc = list.get(0);
            sc.setCount(sc.getCount() + 1L);
            sc.setUpdateTime(date);
            searchCountMapper.updateById(sc);
        } else {
            SearchCount sc = new SearchCount();
            sc.setCount(1L);
            sc.setKeyWord(searchHistory.getKeyWord());
            sc.setCreateTime(date);
            sc.setUpdateTime(date);
            sc.setId(UuidUtils.getUuid());
            searchCountMapper.insert(sc);
        }


        return searchHistoryMapper.insert(searchHistory);
    }
}
