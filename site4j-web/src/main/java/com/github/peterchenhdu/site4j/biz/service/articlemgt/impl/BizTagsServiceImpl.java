/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.ArticleTagsDto;
import com.github.peterchenhdu.site4j.biz.dto.TagsDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleTagQueryDto;
import com.github.peterchenhdu.site4j.biz.dto.req.TagQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.BizTags;
import com.github.peterchenhdu.site4j.biz.mapper.BizTagsMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleTagsService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTagsService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
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
 * 标签
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class BizTagsServiceImpl extends ServiceImpl<BizTagsMapper, BizTags> implements BizTagsService {

    @Autowired
    private BizTagsMapper bizTagsMapper;
    @Autowired
    private BizArticleTagsService bizArticleTagsService;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfoDto<TagsDto> query(TagQueryDto vo) {
        Page<BizTags> page = PageUtils.getPage(vo);
        List<BizTags> list = bizTagsMapper.query(page, vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<TagsDto> boList = new ArrayList<>();
        for (BizTags bizTags : list) {
            boList.add(BeanConvertUtils.doConvert(bizTags, TagsDto.class));
        }

        return new PageInfoDto<>(page.getTotal(), boList);
    }

    @Override
    public int queryCount() {
        return bizTagsMapper.selectCount(new EntityWrapper<>());
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public TagsDto save(TagsDto entity) {
        Assert.notNull(entity, "Tags不可为空！");

        List<BizTags> list = bizTagsMapper.findByName(entity.getName());
        if(!list.isEmpty()) {
            throw new CommonRuntimeException("标签已存在");
        }

        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        bizTagsMapper.insert(entity);
        return entity;
    }

    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param entities
     */
    @Override
    public void insertList(List<TagsDto> entities) {

    }


    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean deleteById(String primaryKey) {
        //删除校验
        PageInfoDto<ArticleTagsDto> page = bizArticleTagsService.query(new ArticleTagQueryDto(primaryKey, null));
        if(ObjectUtils.isNotEmpty(page.getList())) {
            throw new CommonRuntimeException("该标签包含关联文章，不能删除");
        }

        return bizTagsMapper.deleteById(primaryKey) > 0;
    }

    /**
     * 根据主键更新实体全部字段，null值会被更新
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean update(TagsDto entity) {
        Assert.notNull(entity, "Tags不可为空！");



        entity.setUpdateTime(LocalDateTime.now());
        return bizTagsMapper.updateAllColumnById(entity) > 0;
    }

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean updateSelective(TagsDto entity) {
        Assert.notNull(entity, "Tags不可为空！");


        List<BizTags> list = bizTagsMapper.findByName(entity.getName());
        if(!list.isEmpty() && !list.get(0).getId().equals(entity.getId())) {
            throw new CommonRuntimeException("标签已存在");
        }

        entity.setUpdateTime(LocalDateTime.now());
        return bizTagsMapper.updateById(entity) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public TagsDto queryById(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizTags entity = bizTagsMapper.selectById(primaryKey);
        return null == entity ? null : BeanConvertUtils.doConvert(entity, TagsDto.class);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    public TagsDto getOneByEntity(TagsDto entity) {
        Assert.notNull(entity, "Tags不可为空！");
        BizTags bo = bizTagsMapper.selectOne(entity);
        return null == bo ? null : BeanConvertUtils.doConvert(bo, TagsDto.class);
    }

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    @Override
    @RedisCache
    public List<TagsDto> listAll() {
        List<BizTags> entityList = bizTagsMapper.selectList(new EntityWrapper<>());

        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<TagsDto> list = new ArrayList<>();
        for (BizTags entity : entityList) {
            list.add(BeanConvertUtils.doConvert(entity, TagsDto.class));
        }
        return list;
    }

    /**
     * 根据实体中的属性值进行查询，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    public List<TagsDto> listByEntity(TagsDto entity) {
        return null;
    }


}
