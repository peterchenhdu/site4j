/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt.impl;

import club.peterchenhdu.biz.dto.NoticeDto;
import club.peterchenhdu.biz.dto.SysNoticeDto;
import club.peterchenhdu.biz.entity.SysNotice;
import club.peterchenhdu.biz.mapper.SysNoticeMapper;
import club.peterchenhdu.biz.service.sitemgt.SysNoticeService;
import club.peterchenhdu.biz.dto.req.NoticeConditionVO;
import club.peterchenhdu.common.enums.NoticeStatusEnum;
import club.peterchenhdu.common.util.ObjectUtils;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.PageUtils;
import club.peterchenhdu.common.util.UuidUtils;
import club.peterchenhdu.util.BeanConvertUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
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
 * 系统通知
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class SysNoticeServiceImpl extends ServiceImpl<SysNoticeMapper,SysNotice> implements SysNoticeService {

    @Autowired
    private SysNoticeMapper sysNoticeMapper;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfo<NoticeDto> findPageBreakByCondition(NoticeConditionVO vo) {
        Wrapper<SysNotice> example = new EntityWrapper<>();
        if(ObjectUtils.isNotEmpty(vo.getKeywords())) {
            example.like("title", vo.getKeywords());
        }
        example.orderBy("create_time DESC");

        Page<SysNotice> page = PageUtils.getPage(vo);

        List<SysNotice> list = sysNoticeMapper.selectPage(page, example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<NoticeDto> boList = new ArrayList<>();
        for (SysNotice sysNotice : list) {
            boList.add(new NoticeDto(sysNotice));
        }

        return new PageInfo<>(page.getTotal(), boList);
    }

    /**
     * 获取已发布的通知列表
     *
     * @return
     */
    @Override
    public List<SysNoticeDto> listRelease() {
        Wrapper<SysNotice> example = new EntityWrapper<>();
            example.eq("status", NoticeStatusEnum.RELEASE.toString());


        List<SysNotice> list = sysNoticeMapper.selectList(example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<SysNoticeDto> boList = new ArrayList<>();
        for (SysNotice sysNotice : list) {
            boList.add(BeanConvertUtil.doConvert(sysNotice, SysNoticeDto.class));
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
    public NoticeDto insert(NoticeDto entity) {
        Assert.notNull(entity, "Notice不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        sysNoticeMapper.insert(entity.getSysNotice());
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
        return sysNoticeMapper.deleteById(primaryKey) > 0;
    }





    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(NoticeDto entity) {
        Assert.notNull(entity, "Notice不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return sysNoticeMapper.updateById(entity.getSysNotice()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public NoticeDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysNotice entity = sysNoticeMapper.selectById(primaryKey);
        return null == entity ? null : new NoticeDto(entity);
    }






}
