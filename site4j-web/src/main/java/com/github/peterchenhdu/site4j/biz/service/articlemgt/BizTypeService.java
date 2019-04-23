/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt;


import com.github.peterchenhdu.site4j.biz.dto.TypeDto;
import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.biz.dto.req.TypeQueryDto;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 分类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface BizTypeService extends IService<BizType> {

    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    PageInfoDto<TypeDto> query(TypeQueryDto vo);

    List<TypeDto> listParent();

    List<TypeDto> listTypeForMenu();

    int queryCount();

    TypeDto save(TypeDto entity);

    List<TypeDto> listAll();

    TypeDto queryById(String primaryKey);

    boolean updateSelective(TypeDto entity);

    boolean deleteById(String primaryKey);
}
