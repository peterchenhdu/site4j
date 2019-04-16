/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt;


import com.github.peterchenhdu.site4j.biz.dto.ArticleLookDto;
import com.github.peterchenhdu.site4j.biz.entity.BizArticleLook;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleLookQueryDto;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

/**
 * 文章浏览记录
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface ArticleLookService extends IService<BizArticleLook> {

    /**
     * 保存浏览记录
     * @param dto dto
     * @return Integer
     */
    Integer save(ArticleLookDto dto);

    /**
     * 浏览记录查询
     * @param queryDto queryDto
     * @return PageInfoDto
     */
    PageInfoDto<BizArticleLook> query(ArticleLookQueryDto queryDto);
}
