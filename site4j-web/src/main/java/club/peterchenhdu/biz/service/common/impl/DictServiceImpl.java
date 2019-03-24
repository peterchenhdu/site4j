/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.service.common.impl;

import club.peterchenhdu.biz.entity.Dict;
import club.peterchenhdu.biz.mapper.DictMapper;
import club.peterchenhdu.biz.service.common.DictService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/2/5
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
