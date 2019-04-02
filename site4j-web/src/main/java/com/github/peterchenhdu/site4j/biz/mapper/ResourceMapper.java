/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.biz.dto.req.ResourceConditionVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<ResourcesDto> findPageBreakByCondition(Page<ResourcesDto> page, ResourceConditionVO vo);

    List<ResourcesDto> listUserResources(Map<String, Object> map);

    List<ResourcesDto> listByUserId(String userId);

}
