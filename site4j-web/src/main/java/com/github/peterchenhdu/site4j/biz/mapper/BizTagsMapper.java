/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.github.peterchenhdu.site4j.biz.entity.BizTags;
import com.github.peterchenhdu.site4j.biz.dto.req.TagQueryDto;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Repository
public interface BizTagsMapper extends BaseMapper<BizTags> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<BizTags> query(Page<BizTags> page, TagQueryDto vo);

    List<BizTags> findByName(String name);
}
