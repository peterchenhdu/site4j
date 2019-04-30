/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.ArticleTagsDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleTagQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.BizArticleTags;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleTagsMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleTagsService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 文章标签
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class BizArticleTagsServiceImpl extends ServiceImpl<BizArticleTagsMapper,BizArticleTags> implements
        BizArticleTagsService {

    @Autowired
    private BizArticleTagsMapper bizArticleTagsMapper;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfoDto<ArticleTagsDto> query(ArticleTagQueryDto vo) {
        Page<BizArticleTags> page = PageUtils.getPage(vo);
        Wrapper<BizArticleTags> wrapper = new EntityWrapper<>();
        if(ObjectUtils.isNotEmpty(vo.getTagId())) {
            wrapper.eq("tag_id", vo.getTagId());
        }
        if(ObjectUtils.isNotEmpty(vo.getArticleId())) {
            wrapper.eq("article_id", vo.getArticleId());
        }

        List<ArticleTagsDto> list = bizArticleTagsMapper.selectPage(page, wrapper).stream()
                .map(entity->BeanConvertUtils.doConvert(entity, ArticleTagsDto.class))
                .collect(Collectors.toList());

        return new PageInfoDto<>(page.getTotal(), list);
    }

    /**
     * 通过文章id删除文章-标签关联数据
     *
     * @param articleId
     * @return
     */
    @Override
    public int removeByArticleId(String articleId) {
        // 删除 文章-标签关联数据
        Wrapper<BizArticleTags> loveExample = new EntityWrapper<>();
        loveExample.eq("article_id", articleId);
        return bizArticleTagsMapper.delete(loveExample);
    }

    /**
     * 批量添加
     *
     * @param tagIds
     * @param articleId
     */
    @Override
    public void insertList(String[] tagIds, String articleId) {
        if (tagIds == null || tagIds.length == 0) {
            return;
        }
        List<ArticleTagsDto> list = new ArrayList<>();
        ArticleTagsDto articleTags = null;
        for (String tagId : tagIds) {
            articleTags = new ArticleTagsDto();
            articleTags.setId(UuidUtils.getUuid());
            articleTags.setTagId(tagId);
            articleTags.setArticleId(articleId);
            list.add(articleTags);
        }
        this.insertList(list);
    }



    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param dtoList dtoList
     */
    @Override
    public void insertList(List<ArticleTagsDto> dtoList) {
        Assert.notNull(dtoList, "ArticleTagss不可为空！");
        List<BizArticleTags> list = new ArrayList<>();
        for (ArticleTagsDto dto : dtoList) {
            dto.setUpdateTime(LocalDateTime.now());
            dto.setCreateTime(LocalDateTime.now());
            list.add(BeanConvertUtils.doConvert(dto, BizArticleTags.class));
        }
        this.insertBatch(list);
    }



}
