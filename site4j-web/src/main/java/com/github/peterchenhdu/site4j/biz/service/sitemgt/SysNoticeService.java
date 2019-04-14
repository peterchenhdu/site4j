/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.NoticeDto;
import com.github.peterchenhdu.site4j.biz.dto.SysNoticeDto;
import com.github.peterchenhdu.site4j.biz.entity.SysNotice;
import com.github.peterchenhdu.site4j.biz.dto.req.NoticeConditionVO;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 系统通知
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysNoticeService extends IService<SysNotice> {

    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    PageInfoDto<NoticeDto> findPageBreakByCondition(NoticeConditionVO vo);

    /**
     * 获取已发布的通知列表
     *
     * @return List
     */
    List<SysNoticeDto> listRelease();

    /**
     * 根据ID获取通知
     *
     * @param primaryKey primaryKey
     * @return NoticeDto
     */
    NoticeDto getByPrimaryKey(String primaryKey);

    /**
     * 修改通知
     *
     * @param entity entity
     * @return boolean
     */
    boolean updateSelective(NoticeDto entity);

    /**
     * 删除通知
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    boolean removeByPrimaryKey(String primaryKey);

    /**
     * 保存通知
     *
     * @param entity entity
     * @return NoticeDto
     */
    NoticeDto insert(NoticeDto entity);
}
