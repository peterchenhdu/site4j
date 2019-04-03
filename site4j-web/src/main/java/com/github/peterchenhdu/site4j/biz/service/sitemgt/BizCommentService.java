/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.req.CommentConditionVO;
import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.common.exception.CommentException;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;

import java.util.List;
import java.util.Map;

/**
 * 评论
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizCommentService {

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    CommentDto insert(CommentDto entity);

    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param entities
     */
    void insertList(List<CommentDto> entities);

    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    boolean removeByPrimaryKey(String primaryKey);

    /**
     * 根据主键更新实体全部字段，null值会被更新
     *
     * @param entity
     * @return
     */
    boolean update(CommentDto entity);

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    boolean updateSelective(CommentDto entity);

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    CommentDto getByPrimaryKey(String primaryKey);

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity
     * @return
     */
    CommentDto getOneByEntity(CommentDto entity);

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    List<CommentDto> listAll();

    /**
     * 根据实体中的属性值进行查询，查询条件使用等号
     *
     * @param entity
     * @return
     */
    List<CommentDto> listByEntity(CommentDto entity);

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<CommentDto> findPageBreakByCondition(CommentConditionVO vo);

    /**
     * @param vo
     * @return
     */
    Map<String, Object> list(CommentConditionVO vo);

    /**
     * admin发表评论
     *
     * @param comment
     * @return
     */
    void commentForAdmin(CommentDto comment) throws CommentException;

    /**
     * 发表评论
     *
     * @param comment
     * @return
     */
    CommentDto comment(CommentDto comment) throws CommentException;

    /**
     * 查询近期评论
     *
     * @param pageSize
     * @return
     */
    List<CommentDto> listRecentComment(int pageSize);

    /**
     * 查询未审核的评论
     *
     * @param pageSize
     * @return
     */
    List<CommentDto> listVerifying(int pageSize);

    /**
     * 点赞
     *
     * @param id
     */
    void doSupport(String id);

    /**
     * 点踩
     *
     * @param id
     */
    void doOppose(String id);

    int queryCount();
}
