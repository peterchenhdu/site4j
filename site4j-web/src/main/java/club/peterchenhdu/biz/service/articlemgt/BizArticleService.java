/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt;


import club.peterchenhdu.biz.dto.ArticleDto;
import club.peterchenhdu.biz.entity.BizArticle;
import club.peterchenhdu.biz.web.vo.ArticleConditionVO;
import com.baomidou.mybatisplus.service.IService;
import club.peterchenhdu.common.util.PageInfo;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 文章列表
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizArticleService extends IService<BizArticle> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<ArticleDto> findPageBreakByCondition(ArticleConditionVO vo);

    /**
     * 站长推荐
     *
     * @param pageSize
     * @return
     */
    List<ArticleDto> listRecommended(int pageSize);

    /**
     * 近期文章
     *
     * @param pageSize
     * @return
     */
    List<ArticleDto> listRecent(int pageSize);

    /**
     * 随机文章
     *
     * @param pageSize
     * @return
     */
    List<ArticleDto> listRandom(int pageSize);

    /**
     * 获取热门文章
     *
     * @return
     */
    List<ArticleDto> listHotArticle(int pageSize);

    /**
     * 根据某篇文章获取与该文章相关的文章
     *
     * @return
     */
    List<ArticleDto> listRelatedArticle(int pageSize, ArticleDto article);

    /**
     * 获取上一篇和下一篇
     *
     * @param insertTime
     * @return
     */
    Map<String, ArticleDto> getPrevAndNextArticles(LocalDateTime insertTime);

    /**
     * 文章点赞
     *
     * @param id
     */
    void doPraise(String id);

    /**
     * 是否存在文章
     *
     * @param id
     * @return
     */
    boolean isExist(String id);

    /**
     * 获取素材库
     *
     * @return
     */
    List<String> listMaterial();

    /**
     * 发布文章
     * a
     *
     * @param article
     * @param tags
     * @param file
     * @return
     */
    boolean publish(ArticleDto article, String[] tags, MultipartFile file);

    /**
     * 修改置顶、推荐
     *
     * @return
     */
    boolean updateTopOrRecommendedById(String type, String id);

    /**
     * 批量修改状态
     *
     * @param ids
     * @param status
     */
    void batchUpdateStatus(String[] ids, boolean status);


    int queryCount();

    /**
     * 获取归档目录列表
     *
     * @return
     */
    Map<String, List> listArchives();

    List<ArticleDto> listAll();
    ArticleDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(ArticleDto entity);
    boolean removeByPrimaryKey(String primaryKey);
}
