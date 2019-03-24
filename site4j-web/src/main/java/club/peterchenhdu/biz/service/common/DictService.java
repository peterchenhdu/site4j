/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.service.common;

import club.peterchenhdu.biz.entity.Dict;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/2/5
 */
public interface DictService {

    List<Dict> queryByType(String type);
}
