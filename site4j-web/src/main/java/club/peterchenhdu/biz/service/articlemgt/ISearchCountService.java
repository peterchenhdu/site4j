/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.service.articlemgt;

import club.peterchenhdu.biz.entity.SearchCount;

import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/28
 */
public interface ISearchCountService {
    List<SearchCount> listHot(Integer size);
}
