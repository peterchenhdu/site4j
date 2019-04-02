/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common;

import com.github.peterchenhdu.site4j.biz.entity.Dict;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/2/5
 */
public interface DictService {

    List<Dict> queryByType(String type);
}
