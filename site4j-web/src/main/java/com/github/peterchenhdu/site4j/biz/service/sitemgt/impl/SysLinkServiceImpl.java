/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.github.peterchenhdu.site4j.biz.dto.LinkDto;
import com.github.peterchenhdu.site4j.biz.dto.req.LinkConditionVO;
import com.github.peterchenhdu.site4j.biz.entity.SysLink;
import com.github.peterchenhdu.site4j.biz.mapper.SysLinkMapper;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysLinkService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 友情链接
 * <p>
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Service
public class SysLinkServiceImpl implements SysLinkService {

    @Autowired
    private SysLinkMapper sysLinkMapper;


    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    @Override
    public PageInfoDto<LinkDto> findPageBreakByCondition(LinkConditionVO vo) {

        Wrapper<SysLink> example = new EntityWrapper<>();

        if (ObjectUtils.isNotEmpty(vo.getStatus())) {
            example.eq("status", vo.getStatus());
        }
        if (ObjectUtils.isNotEmpty(vo.getHomePageDisplay())) {
            example.eq("home_page_display", vo.getHomePageDisplay());
        }
        if (ObjectUtils.isNotEmpty(vo.getName())) {
            example.like("name", vo.getName());
        }
        if (ObjectUtils.isNotEmpty(vo.getDescription())) {
            example.like("description", vo.getDescription());
        }

        example.orderBy("status ASC, create_time DESC");
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<SysLink> list = sysLinkMapper.selectList(example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<LinkDto> boList = new ArrayList<>();
        for (SysLink sysLink : list) {
            boList.add(new LinkDto(sysLink));
        }
        return new PageInfoDto<>(PageHelper.getTotal(), boList);
    }

    /**
     * 查询可在首页显示的友情链接列表
     *
     * @return List
     */
    @Override
    @RedisCache
    public List<LinkDto> listOfIndex() {
        LinkConditionVO vo = new LinkConditionVO(true, true);
        vo.setPageSize(100);
        PageInfoDto<LinkDto> pageInfo = this.findPageBreakByCondition(vo);
        return pageInfo == null ? null : pageInfo.getList();
    }


    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return LinkDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public LinkDto insert(LinkDto entity) {
        Assert.notNull(entity, "Link不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setStatus(entity.isStatus());
        entity.setHomePageDisplay(entity.isHomePageDisplay());
        entity.setId(UuidUtils.getUuid());
        sysLinkMapper.insert(entity.getSysLink());
        return entity;
    }


    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean removeByPrimaryKey(String primaryKey) {
        return sysLinkMapper.deleteById(primaryKey) > 0;
    }


    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity entity
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean updateSelective(LinkDto entity) {
        Assert.notNull(entity, "Link不可为空！");
        entity.setStatus(entity.isStatus());
        entity.setHomePageDisplay(entity.isHomePageDisplay());
        return sysLinkMapper.updateById(entity.getSysLink()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return LinkDto
     */
    @Override
    public LinkDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysLink entity = sysLinkMapper.selectById(primaryKey);
        return null == entity ? null : new LinkDto(entity);
    }


    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return List
     */
    @Override
    public List<LinkDto> listAll() {
        return null;
    }


}
