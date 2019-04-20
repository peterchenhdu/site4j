/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizArticleArchives;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Repository
public interface BizArticleMapper extends BaseMapper<BizArticle> {

    /**
     * 分页查询，关联查询文章标签、文章类型
     *
     * @param vo
     * @return
     */
    List<BizArticle> query(Page<BizArticle> page, ArticleQueryDto vo);

    /**
     * 统计指定文章的标签集合
     *
     * @param list
     * @return
     */
    List<BizArticle> listTagsByArticleId(List<String> list);

    /**
     * 获取文章详情，关联查询文章标签、文章类型
     *
     * @param id
     * @return
     */
    BizArticle get(String id);

    /**
     * 获取上一篇和下一篇(是否可以通过get时查出来？ BizArticle中关联两个BizArticle：prev & next)
     *
     * @param insertTime
     * @return
     */
    List<BizArticle> getPrevAndNextArticles(LocalDateTime insertTime);

    /**
     * 获取热门文章
     *
     * @return
     */
    List<BizArticle> listHotArticle();

    /**
     * 是否存在文章
     *
     * @param id
     * @return
     */
    Integer isExist(String id);

    /**
     * 获取封面图片素材
     *
     * @return
     */
    List<String> listMaterial();

    /**
     * 批量修改status
     *
     * @param list
     * @param status
     * @return
     */
    int batchUpdateStatus(@Param("list") List<String> list, @Param("status") boolean status);

    List<BizArticleArchives> listArchives();
}
