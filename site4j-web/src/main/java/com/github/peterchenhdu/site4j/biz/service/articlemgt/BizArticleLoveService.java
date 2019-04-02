/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt;


import com.github.peterchenhdu.site4j.biz.dto.ArticleLoveDto;

/**
 * 文章点赞
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizArticleLoveService  {
    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return ArticleLoveDto
     */
    ArticleLoveDto insert(ArticleLoveDto entity);


}
