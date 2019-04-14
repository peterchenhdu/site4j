/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common;

import com.github.peterchenhdu.site4j.biz.entity.Dict;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface DictService {

    List<Dict> queryByType(String type);
}
