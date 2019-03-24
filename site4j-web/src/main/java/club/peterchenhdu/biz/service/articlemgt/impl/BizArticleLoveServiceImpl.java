/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt.impl;

import club.peterchenhdu.biz.dto.ArticleLoveDto;
import club.peterchenhdu.biz.mapper.BizArticleLoveMapper;
import club.peterchenhdu.biz.service.articlemgt.BizArticleLoveService;
import club.peterchenhdu.common.util.UuidUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.time.LocalDateTime;

/**
 * 文章点赞
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class BizArticleLoveServiceImpl implements BizArticleLoveService {

    @Autowired
    private BizArticleLoveMapper bizArticleLoveMapper;


    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return ArticleLoveDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ArticleLoveDto insert(ArticleLoveDto entity) {
        Assert.notNull(entity, "ArticleLove不可为空！");

        LocalDateTime now = LocalDateTime.now();

        entity.setUpdateTime(now);
        entity.setCreateTime(now);
        entity.setId(UuidUtils.getUuid());
        bizArticleLoveMapper.insert(entity.getBizArticleLove());
        return entity;
    }

}
