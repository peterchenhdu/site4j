/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt;


import com.github.peterchenhdu.site4j.biz.dto.ArticleLookDto;
import com.github.peterchenhdu.site4j.biz.entity.BizArticleLook;
import com.github.peterchenhdu.site4j.biz.dto.req.BizArticleLookConditionVo;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

/**
 * 文章浏览记录
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizArticleLookService extends IService<BizArticleLook> {

    ArticleLookDto insert(ArticleLookDto entity);

    PageInfoDto<BizArticleLook> findPageBreakByCondition(BizArticleLookConditionVo vo);
}
