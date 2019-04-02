/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.github.peterchenhdu.site4j.biz.entity.SearchCount;
import com.github.peterchenhdu.site4j.biz.mapper.SearchCountMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.ISearchCountService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/28
 */
@Service
public class SearchCountServiceImpl implements ISearchCountService {
    @Autowired
    private SearchCountMapper searchCountMapper;

    @Override
    public List<SearchCount> listHot(Integer size) {
        Wrapper<SearchCount> wrapper = new EntityWrapper<>();
        wrapper.orderBy("count", false);
        PageHelper.startPage(1, size);
        return searchCountMapper.selectList(wrapper);
    }
}
