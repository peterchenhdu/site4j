/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt;


import club.peterchenhdu.biz.dto.ArticleTagsDto;
import club.peterchenhdu.biz.entity.BizArticleTags;
import club.peterchenhdu.biz.web.vo.ArticleTagsConditionVO;
import com.baomidou.mybatisplus.service.IService;
import club.peterchenhdu.common.util.PageInfo;

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
public interface BizArticleTagsService extends IService<BizArticleTags> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<ArticleTagsDto> findPageBreakByCondition(ArticleTagsConditionVO vo);

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
