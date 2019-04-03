/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt;


import com.github.peterchenhdu.site4j.biz.dto.TypeDto;
import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.biz.dto.req.TypeConditionVO;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 分类
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizTypeService extends IService<BizType> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<TypeDto> findPageBreakByCondition(TypeConditionVO vo);

    List<TypeDto> listParent();

    List<TypeDto> listTypeForMenu();

    int queryCount();

    TypeDto insert(TypeDto entity);
    List<TypeDto> listAll();
    TypeDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(TypeDto entity);
    boolean removeByPrimaryKey(String primaryKey);
}
