/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.NoticeDto;
import com.github.peterchenhdu.site4j.biz.dto.SysNoticeDto;
import com.github.peterchenhdu.site4j.biz.dto.req.NoticeConditionVO;
import com.github.peterchenhdu.site4j.biz.entity.SysNotice;
import com.github.peterchenhdu.site4j.biz.mapper.SysNoticeMapper;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysNoticeService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.enums.NoticeStatusEnum;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 系统通知
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeMapper, SysNotice> implements SysNoticeService {

    @Autowired
    private SysNoticeMapper sysNoticeMapper;

    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    @Override
    public PageInfoDto<NoticeDto> findPageBreakByCondition(NoticeConditionVO vo) {
        Wrapper<SysNotice> example = new EntityWrapper<>();
        if (ObjectUtils.isNotEmpty(vo.getStatus())) {
            example.eq("status", vo.getStatus());
        }
        if (ObjectUtils.isNotEmpty(vo.getTitle())) {
            example.like("title", vo.getTitle());
        }
        if (ObjectUtils.isNotEmpty(vo.getContent())) {
            example.like("content", vo.getContent());
        }
        example.orderBy("create_time DESC");

        Page<SysNotice> page = PageUtils.getPage(vo);
        List<NoticeDto> list = sysNoticeMapper.selectPage(page, example).stream()
                .map(entity -> BeanConvertUtils.doConvert(entity, NoticeDto.class))
                .collect(Collectors.toList());

        return new PageInfoDto<>(page.getTotal(), list);
    }

    /**
     * 获取已发布的通知列表
     *
     * @return List
     */
    @Override
    public List<SysNoticeDto> listRelease() {
        Wrapper<SysNotice> example = new EntityWrapper<>();
        example.eq("status", NoticeStatusEnum.RELEASE.toString());
        return sysNoticeMapper.selectList(example).stream()
                .map(entity -> BeanConvertUtils.doConvert(entity, SysNoticeDto.class))
                .collect(Collectors.toList());
    }

    /**
     * 保存通知
     *
     * @param entity entity
     * @return NoticeDto
     */
    @Override
    public NoticeDto insert(NoticeDto entity) {
        Assert.notNull(entity, "Notice不可为空！");
        sysNoticeMapper.insert(entity.getSysNotice());
        return entity;
    }

    /**
     * 删除通知
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    @Override
    public boolean removeByPrimaryKey(String primaryKey) {
        return sysNoticeMapper.deleteById(primaryKey) > 0;
    }


    /**
     * 修改通知
     *
     * @param entity entity
     * @return boolean
     */
    @Override
    public boolean updateSelective(NoticeDto entity) {
        Assert.notNull(entity, "Notice不可为空！");
        return sysNoticeMapper.updateById(entity.getSysNotice()) > 0;
    }

    /**
     * 根据ID获取通知
     *
     * @param primaryKey primaryKey
     * @return NoticeDto
     */
    @Override
    public NoticeDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysNotice entity = sysNoticeMapper.selectById(primaryKey);
        return null == entity ? null : new NoticeDto(entity);
    }

}
