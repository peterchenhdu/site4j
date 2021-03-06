/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt;


import com.github.peterchenhdu.site4j.biz.dto.ArticleTagsDto;
import com.github.peterchenhdu.site4j.biz.entity.BizArticleTags;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleTagQueryDto;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 文章标签
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface BizArticleTagsService extends IService<BizArticleTags> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<ArticleTagsDto> query(ArticleTagQueryDto vo);

    /**
     * 通过文章id删除文章-标签关联数据
     *
     * @param articleId
     * @return
     */
    int removeByArticleId(String articleId);

    /**
     * 批量添加
     *
     * @param tagIds
     * @param articleId
     */
    void insertList(String[] tagIds, String articleId);

    void insertList(List<ArticleTagsDto> entities);
}
