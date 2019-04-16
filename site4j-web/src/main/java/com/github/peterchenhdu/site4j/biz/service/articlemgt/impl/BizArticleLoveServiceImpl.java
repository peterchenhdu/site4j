/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.github.peterchenhdu.site4j.biz.dto.ArticleLoveDto;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleLoveMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleLoveService;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.time.LocalDateTime;

/**
 * 文章点赞
 * <p>
 * Created by chenpi on 2019/02/05.
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
    public ArticleLoveDto save(ArticleLoveDto entity) {
        Assert.notNull(entity, "ArticleLove不可为空！");

        LocalDateTime now = LocalDateTime.now();

        entity.setUpdateTime(now);
        entity.setCreateTime(now);
        entity.setId(UuidUtils.getUuid());
        bizArticleLoveMapper.insert(entity.getBizArticleLove());
        return entity;
    }

}
