/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentConditionVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Repository
public interface BizCommentMapper extends BaseMapper<BizComment> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<BizComment> findPageBreakByCondition(CommentConditionVO vo);

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

    /**
     * 获取单个评论，关联查询文章信息
     *
     * @param id
     */
    BizComment getById(String id);
}
