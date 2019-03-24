/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.service.articlemgt.impl;

import club.peterchenhdu.biz.entity.SearchCount;
import club.peterchenhdu.biz.mapper.SearchCountMapper;
import club.peterchenhdu.biz.service.articlemgt.ISearchCountService;
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
