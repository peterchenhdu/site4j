/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt.impl;

import club.peterchenhdu.biz.dto.TagsDto;
import club.peterchenhdu.biz.entity.BizTags;
import club.peterchenhdu.biz.mapper.BizTagsMapper;
import club.peterchenhdu.biz.service.articlemgt.BizTagsService;
import club.peterchenhdu.biz.web.vo.TagsConditionVO;
import club.peterchenhdu.common.annotation.RedisCache;
import club.peterchenhdu.common.exception.BaseRuntimeException;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.UuidUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
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
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class BizTagsServiceImpl implements BizTagsService {

    @Autowired
    private BizTagsMapper bizTagsMapper;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfo<TagsDto> findPageBreakByCondition(TagsConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizTags> list = bizTagsMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<TagsDto> boList = new ArrayList<>();
        for (BizTags bizTags : list) {
            boList.add(new TagsDto(bizTags));
        }

        return new PageInfo<>(PageHelper.getTotal(), boList);
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
    public TagsDto insert(TagsDto entity) {
        Assert.notNull(entity, "Tags不可为空！");

        List<BizTags> list = bizTagsMapper.findByName(entity.getName());
        if(!list.isEmpty()) {
            throw new BaseRuntimeException("标签已存在");
        }

        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        bizTagsMapper.insert(entity.getBizTags());
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
    public boolean removeByPrimaryKey(String primaryKey) {
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
        return bizTagsMapper.updateAllColumnById(entity.getBizTags()) > 0;
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
            throw new BaseRuntimeException("标签已存在");
        }

        entity.setUpdateTime(LocalDateTime.now());
        return bizTagsMapper.updateById(entity.getBizTags()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public TagsDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizTags entity = bizTagsMapper.selectById(primaryKey);
        return null == entity ? null : new TagsDto(entity);
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
        BizTags bo = bizTagsMapper.selectOne(entity.getBizTags());
        return null == bo ? null : new TagsDto(bo);
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
            list.add(new TagsDto(entity));
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
