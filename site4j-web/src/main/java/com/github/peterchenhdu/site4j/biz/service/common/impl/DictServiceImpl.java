/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common.impl;

import com.github.peterchenhdu.site4j.biz.entity.Dict;
import com.github.peterchenhdu.site4j.biz.mapper.DictMapper;
import com.github.peterchenhdu.site4j.biz.service.common.DictService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class DictServiceImpl implements DictService {

    @Autowired
    private DictMapper dictMapper;

    @Override
    public List<Dict> queryByType(String type) {
        Wrapper<Dict> example = new EntityWrapper<>();
        example.eq("dict_type", type);
        return dictMapper.selectList(example);
    }
}
