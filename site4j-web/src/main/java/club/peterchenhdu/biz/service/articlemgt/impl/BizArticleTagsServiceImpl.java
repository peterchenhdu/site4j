/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt.impl;

import club.peterchenhdu.biz.dto.ArticleTagsDto;
import club.peterchenhdu.biz.entity.BizArticleTags;
import club.peterchenhdu.biz.mapper.BizArticleTagsMapper;
import club.peterchenhdu.biz.service.articlemgt.BizArticleTagsService;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.UuidUtils;
import club.peterchenhdu.biz.web.vo.ArticleTagsConditionVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 文章标签
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
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
    public PageInfo<ArticleTagsDto> findPageBreakByCondition(ArticleTagsConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizArticleTags> list = bizArticleTagsMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<ArticleTagsDto> boList = new ArrayList<>();
        for (BizArticleTags bizArticleTags : list) {
            boList.add(new ArticleTagsDto(bizArticleTags));
        }
        return new PageInfo<>(PageHelper.getTotal(), boList);
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
     * @param entities
     */
    @Override
    public void insertList(List<ArticleTagsDto> entities) {
        Assert.notNull(entities, "ArticleTagss不可为空！");
        List<BizArticleTags> list = new ArrayList<>();
        for (ArticleTagsDto entity : entities) {
            entity.setUpdateTime(LocalDateTime.now());
            entity.setCreateTime(LocalDateTime.now());
            list.add(entity.getBizArticleTags());
        }
        this.insertBatch(list);
    }



}
