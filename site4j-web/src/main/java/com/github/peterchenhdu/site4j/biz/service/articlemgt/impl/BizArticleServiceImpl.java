/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.articlemgt.impl;


import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.ArticleArchivesDto;
import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.*;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleLookMapper;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleLoveMapper;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleMapper;
import com.github.peterchenhdu.site4j.biz.mapper.BizArticleTagsMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleTagsService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.ISearchHistoryService;
import com.github.peterchenhdu.site4j.biz.service.common.IImageService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.common.base.BaseEntity;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.common.util.web.IpUtils;
import com.github.peterchenhdu.site4j.common.util.web.WebUtils;
import com.github.peterchenhdu.site4j.enums.ArticleStatusEnum;
import com.github.peterchenhdu.site4j.enums.ImageType;
import com.github.peterchenhdu.site4j.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * 文章列表
 * <p>
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
@Slf4j
public class BizArticleServiceImpl extends ServiceImpl<BizArticleMapper, BizArticle> implements BizArticleService {

    @Autowired
    private BizArticleMapper bizArticleMapper;
    @Autowired
    private BizArticleLoveMapper bizArticleLoveMapper;
    @Autowired
    private BizArticleLookMapper bizArticleLookMapper;
    @Autowired
    private BizArticleTagsMapper bizArticleTagsMapper;
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private BizArticleTagsService articleTagsService;
    @Autowired
    private ISearchHistoryService searchHistoryService;

    @Autowired
    private IImageService imageService;

    /**
     * 分页查询
     *
     * @param vo ArticleConditionVO
     * @return PageInfo
     */
    @Override
    public PageInfoDto<ArticleDto> query(ArticleQueryDto vo) {
        //保存搜索记录
        if (ObjectUtils.isNotEmpty(vo.getKeywords())) {
            log.info("开始搜索内容，关键字:{}", vo.getKeywords());
            String userIp = IpUtils.getRealIp(WebUtils.getRequest());
            String keyWord = vo.getKeywords();
            SearchHistory searchHistory = new SearchHistory();
            searchHistory.setKeyWord(keyWord);
            searchHistory.setUserIp(userIp);
            searchHistory.setSearchTime(LocalDateTime.now());
            if (SessionUtil.getUser() != null) {
                searchHistory.setUserId(SessionUtil.getUser().getId());
            }
            searchHistory.setUpdateTime(LocalDateTime.now());
            searchHistory.setCreateTime(LocalDateTime.now());
            searchHistoryService.save(searchHistory);
        }


        Page<BizArticle> page = PageUtils.getPage(vo);
        List<BizArticle> list = bizArticleMapper.query(page, vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }

        List<String> ids = list.stream().map(BaseEntity::getId).collect(Collectors.toList());


        List<BizArticle> listTag = bizArticleMapper.listTagsByArticleId(ids);

        // listTag, 重新组装数据为{id: Article}
        Map<String, BizArticle> tagMap = new LinkedHashMap<>(listTag.size());
        for (BizArticle bizArticle : listTag) {
            tagMap.put(bizArticle.getId(), bizArticle);
        }

        List<ArticleDto> boList = new LinkedList<>();
        for (BizArticle bizArticle : list) {
            BizArticle tagArticle = tagMap.get(bizArticle.getId());
            bizArticle.setTags(tagArticle == null ? Collections.EMPTY_LIST : tagArticle.getTags());
            bizArticle.setCoverImage(bizArticle.getCoverImage());
            boList.add(new ArticleDto(bizArticle));
        }

        return new PageInfoDto<>(page.getTotal(), boList);
    }

    /**
     * 站长推荐
     *
     * @param pageSize pageSize
     * @return List
     */
    @Override
    public List<ArticleDto> listRecommended(int pageSize) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setRecommended(true);
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageInfoDto pageInfo = this.query(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 近期文章
     *
     * @param pageSize pageSize
     * @return List
     */
    @Override
    public List<ArticleDto> listRecent(int pageSize) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setPageSize(pageSize);
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        PageInfoDto pageInfo = this.query(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 随机文章
     *
     * @param pageSize pageSize
     * @return List
     */
    @Override
    public List<ArticleDto> listRandom(int pageSize) {
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setRandom(true);
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        vo.setPageSize(pageSize);
        PageInfoDto pageInfo = this.query(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 根据某篇文章获取与该文章相关的文章<br>
     * 搜索同类型、同标签下的文章
     *
     * @param pageSize pageSize
     * @param article  article
     * @return List
     */
    @Override
    public List<ArticleDto> listRelatedArticle(int pageSize, ArticleDto article) {
        if (null == article) {
            return listRandom(pageSize);
        }
        ArticleQueryDto vo = new ArticleQueryDto();
        vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
        List<BizTags> tags = article.getTags();
        if (!CollectionUtils.isEmpty(tags)) {
            List<String> tagIds = new ArrayList<>();
            for (BizTags tag : tags) {
                tagIds.add(tag.getId());
            }
            vo.setTagIds(tagIds);
        }
        vo.setTypeId(article.getTypeId());
        vo.setPageSize(pageSize);
        PageInfoDto pageInfo = this.query(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 获取上一篇和下一篇
     *
     * @return Map
     */
    @Override
    public Map<String, ArticleDto> getPrevAndNextArticles(LocalDateTime insertTime) {
        insertTime = null == insertTime ? LocalDateTime.now() : insertTime;
        List<BizArticle> entityList = bizArticleMapper.getPrevAndNextArticles(insertTime);
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        Map<String, ArticleDto> resultMap = new HashMap<>();
        for (BizArticle entity : entityList) {
            if (entity.getCreateTime().isBefore(insertTime)) {
                resultMap.put("prev", new ArticleDto(entity));
            } else {
                resultMap.put("next", new ArticleDto(entity));
            }
        }
        return resultMap;
    }

    /**
     * 文章点赞
     *
     * @param id id
     */
    @Override
    @RedisCache(flush = true)
    public void doPraise(String id) {
        String ip = IpUtils.getRealIp(WebUtils.getRequest());
        String key = ip + "_doPraise_" + id;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        if (Boolean.TRUE.equals(redisTemplate.hasKey(key))) {
            throw new CommonRuntimeException("一个小时只能点赞一次哈，感谢支持~~");
        }
        UserDto user = SessionUtil.getUser();
        BizArticleLove love = new BizArticleLove();
        if (null != user) {
            love.setUserId(user.getId());
        }
        love.setArticleId(id);
        love.setUserIp(IpUtils.getRealIp(WebUtils.getRequest()));
        love.setLoveTime(LocalDateTime.now());
        love.setCreateTime(LocalDateTime.now());
        love.setUpdateTime(LocalDateTime.now());
        bizArticleLoveMapper.insert(love);
        operations.set(key, id, 1, TimeUnit.HOURS);
    }

    /**
     * 是否存在文章
     *
     * @param id id
     * @return boolean
     */
    @Override
    public boolean isExist(String id) {
        Integer count = bizArticleMapper.isExist(id);
        return count != null && count > 0;
    }

    /**
     * 获取素材库
     *
     * @return List
     */
    @Override
    public List<String> listMaterial() {
        return bizArticleMapper.listMaterial();
    }

    /**
     * 发布文章
     *
     * @param article article
     * @param tags    tags
     * @param file    file
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean publish(ArticleDto article, String[] tags, MultipartFile file) {
        if (null == tags || tags.length <= 0) {
            throw new CommonRuntimeException("请至少选择一个标签");
        }
        if (null != file) {
            String filePath = imageService.uploadToTencentCos(file, ImageType.COVER_IMAGE, true);
            // 保存封面图片
            article.setCoverImage(filePath);
        }
        String articleId = article.getId();
        if (ObjectUtils.isNotEmpty(articleId)) {
            this.updateSelective(article);
        } else {
            article.setUserId(SessionUtil.getUser().getId());
            articleId = this.save(article).getId();
        }
        if (ObjectUtils.isNotEmpty(articleId)) {
            articleTagsService.removeByArticleId(articleId);
            articleTagsService.insertList(tags, articleId);
        }
        return true;
    }

    /**
     * 修改置顶、推荐
     *
     * @param type type
     * @param id   id
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateTopOrRecommendedById(String type, String id) {
        BizArticle article = bizArticleMapper.selectById(id);
        article.setId(id);
        if ("top".equals(type)) {
            article.setTop(!article.getTop());
        } else {
            article.setRecommended(!article.getRecommended());
        }
        article.setUpdateTime(LocalDateTime.now());
        return bizArticleMapper.updateById(article) > 0;
    }

    @Override
    public void batchUpdateStatus(String[] ids, boolean status) {
        if (ids == null || ids.length <= 0) {
            return;
        }
        bizArticleMapper.batchUpdateStatus(Arrays.asList(ids), status);
    }

    @Override
    public int queryCount() {
        Wrapper<BizArticle> example = new EntityWrapper<>();
        example.eq("status", 1);
        return bizArticleMapper.selectCount(example);
    }

    /**
     * 获取热门文章
     *
     * @return List
     */
    @Override
    public List<ArticleDto> listHotArticle(int pageSize) {
        PageHelper.startPage(1, pageSize);

        List<BizArticle> entityList = bizArticleMapper.listHotArticle();
        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<ArticleDto> list = new ArrayList<>();
        for (BizArticle entity : entityList) {
            list.add(new ArticleDto(entity));
        }
        return list;
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return ArticleDto
     */
    @Transactional(rollbackFor = Exception.class)
    public ArticleDto save(ArticleDto entity) {
        Assert.notNull(entity, "Article不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setOriginal(entity.isOriginal());
        entity.setComment(entity.isComment());
        entity.setId(UuidUtils.getUuid());
        bizArticleMapper.insert(entity.getBizArticle());
        return entity;
    }

    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param entities entities
     */
    public void insertList(List<ArticleDto> entities) {
        Assert.notNull(entities, "Articles不可为空！");
        List<BizArticle> list = new ArrayList<>();
        for (ArticleDto entity : entities) {
            entity.setUpdateTime(LocalDateTime.now());
            entity.setCreateTime(LocalDateTime.now());
            entity.setOriginal(entity.isOriginal());
            entity.setComment(entity.isComment());
            list.add(entity.getBizArticle());
        }
        this.insertBatch(list);
    }

    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteById(String primaryKey) {
        boolean result = bizArticleMapper.deleteById(primaryKey) > 0;
        // 删除标签记录
        Wrapper<BizArticleTags> loveExample = new EntityWrapper<>();
        loveExample.eq("article_id", primaryKey);
        bizArticleTagsMapper.delete(loveExample);
        // 删除查看记录
        Wrapper<BizArticleLook> lookExample = new EntityWrapper<>();
        lookExample.eq("article_id", primaryKey);
        bizArticleLookMapper.delete(lookExample);
        // 删除赞记录
        Wrapper<BizArticleLove> tagsExample = new EntityWrapper<>();
        tagsExample.eq("article_id", primaryKey);
        bizArticleLoveMapper.delete(tagsExample);
        return result;
    }


    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity entity
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(ArticleDto entity) {
        Assert.notNull(entity, "Article不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setOriginal(entity.isOriginal());
        entity.setComment(entity.isComment());
        return bizArticleMapper.updateById(entity.getBizArticle()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return ArticleDto
     */
    @Override
    public ArticleDto queryById(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizArticle entity = bizArticleMapper.get(primaryKey);
        return null == entity ? null : new ArticleDto(entity);
    }


    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return List
     */
    @Override
    public List<ArticleDto> listAll() {
        List<BizArticle> entityList = this.selectList(new EntityWrapper<>());

        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<ArticleDto> list = new ArrayList<>();
        for (BizArticle entity : entityList) {
            list.add(new ArticleDto(entity));
        }
        return list;
    }


    @Override
    public Map<String, List> listArchives() {
        List<BizArticleArchives> articleArchivesList = bizArticleMapper.listArchives();
        if (CollectionUtils.isEmpty(articleArchivesList)) {
            return null;
        }
        Map<String, List> resultMap = new HashMap<>();
        List<String> years = new LinkedList<>();
        for (BizArticleArchives bizArticleArchives : articleArchivesList) {
            String datetime = bizArticleArchives.getDatetime();
            String[] datetimeArr = datetime.split("-");
            String year = datetimeArr[0];
            String month = datetimeArr[1];
            String day = datetimeArr[2];
            String yearMonth = year + "-" + month;
            // 保存年
            addToList(years, year, null, null);
            // 保存月
            addToList(resultMap.get(year), month, resultMap, year);
            // 保存日
            addToList(resultMap.get(yearMonth), day, resultMap, yearMonth);
            // 保存文章
            addToList(resultMap.get(datetime), new ArticleArchivesDto(bizArticleArchives), resultMap, datetime);
        }
        resultMap.put("years", years);
        return resultMap;
    }

    private <T> void addToList(List<T> list, T value, Map<String, List> map, String key) {
        if (null == list) {
            // 初始化后保存
            list = new LinkedList<>();
            list.add(value);
            if (null != map && !StringUtils.isEmpty(key)) {
                map.put(key, list);
            }
        } else {
            // 去重
            if (!list.contains(value)) {
                list.add(value);
            }
        }
    }
}
