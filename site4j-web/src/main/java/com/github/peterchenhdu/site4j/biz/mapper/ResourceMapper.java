/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.biz.dto.req.ResourceQueryDto;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<ResourcesDto> query(Page<ResourcesDto> page, ResourceQueryDto vo);

    List<ResourcesDto> listUserResources(Map<String, Object> map);

    List<ResourcesDto> listByUserId(String userId);

}
