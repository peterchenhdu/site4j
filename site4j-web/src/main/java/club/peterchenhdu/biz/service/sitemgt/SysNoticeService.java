/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt;


import club.peterchenhdu.biz.dto.NoticeDto;
import club.peterchenhdu.biz.dto.SysNoticeDto;
import club.peterchenhdu.biz.entity.SysNotice;
import club.peterchenhdu.biz.dto.req.NoticeConditionVO;
import com.baomidou.mybatisplus.service.IService;
import club.peterchenhdu.common.util.PageInfo;

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
