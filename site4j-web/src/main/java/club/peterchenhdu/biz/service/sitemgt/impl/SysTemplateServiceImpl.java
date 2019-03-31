/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt.impl;

import club.peterchenhdu.biz.dto.TemplateDto;
import club.peterchenhdu.biz.entity.SysTemplate;
import club.peterchenhdu.common.enums.TemplateKeyEnum;
import club.peterchenhdu.biz.mapper.SysTemplateMapper;
import club.peterchenhdu.biz.service.sitemgt.SysTemplateService;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.UuidUtils;
import club.peterchenhdu.biz.dto.req.TemplateConditionVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 系统模板
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class SysTemplateServiceImpl extends ServiceImpl<SysTemplateMapper,SysTemplate> implements SysTemplateService {

    @Autowired
    private SysTemplateMapper sysTemplateMapper;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfo<TemplateDto> findPageBreakByCondition(TemplateConditionVO vo) {


        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<SysTemplate> list = sysTemplateMapper.selectList(new EntityWrapper<>());
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<TemplateDto> boList = new ArrayList<>();
        for (SysTemplate sysTemplate : list) {
            boList.add(new TemplateDto(sysTemplate));
        }

        return new PageInfo<>(PageHelper.getTotal(), boList);
    }

    /**
     * 通过key获取模板信息
     *
     * @param key
     * @return
     */
    @Override
    public TemplateDto getTemplate(TemplateKeyEnum key) {
        TemplateDto entity = new TemplateDto();
        entity.setRefKey(key.toString());
        return this.getOneByEntity(entity);
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public TemplateDto insert(TemplateDto entity) {
        Assert.notNull(entity, "Template不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        sysTemplateMapper.insert(entity.getSysTemplate());
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
    public boolean removeByPrimaryKey(String primaryKey) {
        return sysTemplateMapper.deleteById(primaryKey) > 0;
    }



    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(TemplateDto entity) {
        Assert.notNull(entity, "Template不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return sysTemplateMapper.updateById(entity.getSysTemplate()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public TemplateDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysTemplate entity = sysTemplateMapper.selectById(primaryKey);
        return null == entity ? null : new TemplateDto(entity);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    public TemplateDto getOneByEntity(TemplateDto entity) {
        Assert.notNull(entity, "Template不可为空！");
        SysTemplate bo = sysTemplateMapper.selectOne(entity.getSysTemplate());
        return null == bo ? null : new TemplateDto(bo);
    }




}
