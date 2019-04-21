/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.TypeDto;
import com.github.peterchenhdu.site4j.biz.dto.req.TypeQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.biz.mapper.BizTypeMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTypeService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 分类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class BizTypeServiceImpl extends ServiceImpl<BizTypeMapper, BizType> implements BizTypeService {

    @Autowired
    private BizTypeMapper bizTypeMapper;

    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    @Override
    public PageInfoDto<TypeDto> query(TypeQueryDto vo) {
        Page<BizType> page = PageUtils.getPage(vo);
        List<TypeDto> list = bizTypeMapper.query(page, vo);

        return new PageInfoDto<>(page.getTotal(), list);
    }

    @Override
    public List<TypeDto> listParent() {
        List<BizType> list = bizTypeMapper.listParent();
        return getTypes(list);
    }

    @Override
    public List<TypeDto> listTypeForMenu() {
        TypeQueryDto vo = new TypeQueryDto();
        vo.setPageNumber(1);
        vo.setPageSize(100);
        List<BizType> entityList = bizTypeMapper.listTypeForMenu();


        return getTypes(entityList);
    }

    @Override
    public int queryCount() {
        Wrapper<BizType> example = new EntityWrapper<>();
        example.eq("available", true);
        return bizTypeMapper.selectCount(example);
    }

    private List<TypeDto> getTypes(List<BizType> list) {
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<TypeDto> boList = new ArrayList<>();
        for (BizType bizType : list) {
            boList.add(BeanConvertUtils.doConvert(bizType, TypeDto.class));
        }
        return boList;
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public TypeDto save(TypeDto entity) {
        Assert.notNull(entity, "Type不可为空！");
        List<BizType> list = bizTypeMapper.findByName(entity.getName());
        if(!list.isEmpty()) {
            throw new CommonRuntimeException("分类已存在");
        }

        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        bizTypeMapper.insert(entity);
        return entity;
    }

    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteById(String primaryKey) {
        return bizTypeMapper.deleteById(primaryKey) > 0;
    }

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(TypeDto entity) {
        Assert.notNull(entity, "Type不可为空！");
        List<BizType> list = bizTypeMapper.findByName(entity.getName());
        if(!list.isEmpty() && !list.get(0).getId().equals(entity.getId())) {
            throw new CommonRuntimeException("分类已存在");
        }

        entity.setUpdateTime(LocalDateTime.now());
        return bizTypeMapper.updateById(entity) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public TypeDto queryById(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizType entity = bizTypeMapper.selectById(primaryKey);
        return null == entity ? null : BeanConvertUtils.doConvert(entity, TypeDto.class);
    }

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    @Override
    public List<TypeDto> listAll() {

        List<BizType> entityList = bizTypeMapper.selectList(new EntityWrapper<>());

        List<TypeDto> list = getTypes(entityList);
        if (list == null) return null;
        return list;
    }


}
