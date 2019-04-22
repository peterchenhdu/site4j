/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.req.CommentQueryDto;
import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;

import java.util.List;
import java.util.Map;

/**
 * 评论
 * <p>
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface BizCommentService {

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return CommentDto
     */
    CommentDto save(CommentDto entity);


    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    boolean deleteById(String primaryKey);



    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity entity
     * @return boolean
     */
    boolean updateSelective(CommentDto entity);

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return CommentDto
     */
    CommentDto queryById(String primaryKey);


    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return List
     */
    List<CommentDto> listAll();


    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    PageInfoDto<CommentDto> query(CommentQueryDto vo);

    /**
     * @param vo vo
     * @return Map
     */
    Map<String, Object> list(CommentQueryDto vo);

    /**
     * admin发表评论
     *
     * @param comment comment
     */
    void commentForAdmin(CommentDto comment);

    /**
     * 发表评论
     *
     * @param comment comment
     * @return CommentDto
     */
    CommentDto comment(CommentDto comment);

    /**
     * 查询近期评论
     *
     * @param pageSize pageSize
     * @return List
     */
    List<CommentDto> listRecentComment(int pageSize);

    /**
     * 查询未审核的评论
     *
     * @param pageSize pageSize
     * @return List
     */
    List<CommentDto> listVerifying(int pageSize);

    /**
     * 点赞
     *
     * @param id id
     */
    void doSupport(String id);

    /**
     * 点踩
     *
     * @param id id
     */
    void doOppose(String id);

    int queryCount();
}
