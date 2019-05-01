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
import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizType;
import com.github.peterchenhdu.site4j.biz.mapper.BizTypeMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTypeService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 分类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class BizTypeServiceImpl extends ServiceImpl<BizTypeMapper, BizType> implements BizTypeService {

    @Autowired
    private BizTypeMapper bizTypeMapper;
    @Autowired
    private BizArticleService bizArticleService;

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
        return bizTypeMapper.listParent().stream()
                .map(dto -> BeanConvertUtils.doConvert(dto, TypeDto.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<TypeDto> listTypeForMenu() {
        List<BizType> entityList = bizTypeMapper.listTypeForMenu();

        Map<String, TypeDto> map = new HashMap<>();
        entityList.forEach(entity -> {
            if (ObjectUtils.isEmpty(entity.getPid())) {
                TypeDto typeDto = BeanConvertUtils.doConvert(entity, TypeDto.class);
                if(typeDto == null) return;
                typeDto.setSubIds(typeDto.getId());
                map.put(entity.getId(), typeDto);
            }
        });
        entityList.forEach(entity -> {
            if (ObjectUtils.isNotEmpty(entity.getPid())) {
                TypeDto typeDto = map.get(entity.getPid());
                typeDto.getNodes().add(BeanConvertUtils.doConvert(entity, TypeDto.class));
                typeDto.setSubIds(typeDto.getSubIds() + "," + entity.getId());
            }
        });
        return new ArrayList<>(map.values()).stream().sorted(Comparator.comparingInt(BizType::getSort)).collect(Collectors.toList());
    }

    @Override
    public List<String> queryChildByTypeId(String id) {
        Wrapper<BizType> wrapper = new EntityWrapper<>();
        wrapper.eq("pid", id);
        return this.baseMapper.selectList(wrapper).stream().map(BizType::getId).collect(Collectors.toList());
    }

    @Override
    public int queryCount() {
        Wrapper<BizType> example = new EntityWrapper<>();
        example.eq("available", true);
        return bizTypeMapper.selectCount(example);
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return TypeDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public TypeDto save(TypeDto entity) {
        Assert.notNull(entity, "Type不可为空！");
        List<BizType> list = bizTypeMapper.findByName(entity.getName());
        if (!list.isEmpty()) {
            throw new CommonRuntimeException("分类已存在");
        }

        bizTypeMapper.insert(entity);
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
    public boolean deleteById(String primaryKey) {
        List<String> ids = queryChildByTypeId(primaryKey);
        ids.add(primaryKey);


        Wrapper<BizArticle> wrapper = new EntityWrapper<>();
        wrapper.in("type_id", ids);
        int count = bizArticleService.selectCount(wrapper);
        if(count>0) {
            throw new CommonRuntimeException("该分类下存在关联文章，不能删除");
        }
        return bizTypeMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity entity
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(TypeDto entity) {
        Assert.notNull(entity, "Type不可为空！");
        List<BizType> list = bizTypeMapper.findByName(entity.getName());
        if (!list.isEmpty() && !list.get(0).getId().equals(entity.getId())) {
            throw new CommonRuntimeException("分类已存在");
        }
        return bizTypeMapper.updateById(entity) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return TypeDto
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
     * @return List
     */
    @Override
    public List<TypeDto> listAll() {
        return bizTypeMapper.selectList(new EntityWrapper<>()).stream()
                .map(dto -> BeanConvertUtils.doConvert(dto, TypeDto.class))
                .collect(Collectors.toList());
    }
}
