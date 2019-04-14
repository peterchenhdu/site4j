/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.biz.dto.req.TypeConditionVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Repository
public interface BizTypeMapper extends BaseMapper<BizType> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<BizType> findPageBreakByCondition(TypeConditionVO vo);

    List<BizType> listParent();

    List<BizType> listTypeForMenu();

    List<BizType> findByName(String name);
}
