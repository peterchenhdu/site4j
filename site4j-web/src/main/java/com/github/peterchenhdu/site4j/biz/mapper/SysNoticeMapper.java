/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.github.peterchenhdu.site4j.biz.entity.SysNotice;
import com.github.peterchenhdu.site4j.biz.dto.req.NoticeConditionVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Repository
public interface SysNoticeMapper extends BaseMapper<SysNotice> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysNotice> findPageBreakByCondition(NoticeConditionVO vo);
}
