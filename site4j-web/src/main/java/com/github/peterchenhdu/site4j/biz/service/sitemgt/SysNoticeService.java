/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.NoticeDto;
import com.github.peterchenhdu.site4j.biz.dto.SysNoticeDto;
import com.github.peterchenhdu.site4j.biz.entity.SysNotice;
import com.github.peterchenhdu.site4j.biz.dto.req.NoticeConditionVO;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 系统通知
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysNoticeService extends IService<SysNotice> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<NoticeDto> findPageBreakByCondition(NoticeConditionVO vo);

    /**
     * 获取已发布的通知列表
     *
     * @return
     */
    List<SysNoticeDto> listRelease();

    NoticeDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(NoticeDto entity);
    boolean removeByPrimaryKey(String primaryKey);
    NoticeDto insert(NoticeDto entity);
}
