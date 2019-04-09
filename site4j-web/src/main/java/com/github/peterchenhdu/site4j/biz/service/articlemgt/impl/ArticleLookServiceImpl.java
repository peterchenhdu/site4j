/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.ArticleLookDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleLookQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.BizArticleLook;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleLookMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.ArticleLookService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 文章浏览记录
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class ArticleLookServiceImpl extends ServiceImpl<BizArticleLookMapper, BizArticleLook> implements ArticleLookService {

    /**
     * 保存浏览记录
     *
     * @param dto dto
     * @return Integer
     */
    @Override
    public Integer insert(ArticleLookDto dto) {
        return this.baseMapper.insert(BeanConvertUtils.doConvert(dto, BizArticleLook.class));
    }

    /**
     * 浏览记录查询
     *
     * @param queryDto queryDto
     * @return PageInfoDto
     */
    @Override
    public PageInfoDto<BizArticleLook> query(ArticleLookQueryDto queryDto) {
        Wrapper<BizArticleLook> wrapper = new EntityWrapper<>();
        if (ObjectUtils.isNotEmpty(queryDto.getLookTimeFrom())) {
            wrapper.ge("look_time", queryDto.getLookTimeFrom());
        }
        if (ObjectUtils.isNotEmpty(queryDto.getLookTimeTo())) {
            wrapper.le("look_time", queryDto.getLookTimeTo());
        }
        wrapper.orderBy("create_time", false);

        Page<BizArticleLook> page = PageUtils.getPage(queryDto);
        List<BizArticleLook> list = this.baseMapper.selectPage(page, wrapper);
        return PageUtils.getPageInfo(page, list);
    }

}
