/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.common.util;

import club.peterchenhdu.common.base.BaseCondition;
import com.baomidou.mybatisplus.plugins.Page;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/3/10
 */
public class PageUtils {

    public static <T> Page<T> getPage(BaseCondition baseCondition) {

        return new Page<>(baseCondition.getPageNumber(), baseCondition.getPageSize());

    }

    public static <T> PageInfo<T> getPageInfo(Page<T> page, List<T> list) {
        PageInfo<T> pageInfo = new PageInfo<>();
        pageInfo.setList(list);
        pageInfo.setTotal(page.getTotal());
        pageInfo.setPageSize(page.getSize());
        pageInfo.setPageNum(page.getCurrent());
        return pageInfo;

    }

}
