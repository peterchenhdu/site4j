/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.articlemgt;

import com.github.peterchenhdu.site4j.biz.entity.SearchCount;

import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/28
 */
public interface ISearchCountService {
    List<SearchCount> listHot(Integer size);
}
