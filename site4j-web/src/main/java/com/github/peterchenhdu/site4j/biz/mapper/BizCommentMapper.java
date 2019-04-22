/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.mapper;

import com.baomidou.mybatisplus.plugins.Page;
import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentQueryDto;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Repository
public interface BizCommentMapper extends BaseMapper<BizComment> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<BizComment> query(Page<BizComment> page, CommentQueryDto vo);

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
