/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.util;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;

import java.util.List;

/**
 * 分页工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class PageUtils {

    public static <T> Page<T> getPage(BasePagingQueryDto baseCondition) {

        return new Page<>(baseCondition.getPageNumber(), baseCondition.getPageSize());

    }

    public static <T> PageInfoDto<T> getPageInfo(Page<T> page, List<T> list) {
        PageInfoDto<T> pageInfo = new PageInfoDto<>();
        pageInfo.setList(list);
        pageInfo.setTotal(page.getTotal());
        pageInfo.setPageSize(page.getSize());
        pageInfo.setPageNum(page.getCurrent());
        return pageInfo;

    }

}
