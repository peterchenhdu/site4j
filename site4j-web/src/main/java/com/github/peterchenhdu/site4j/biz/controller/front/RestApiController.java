/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.front;

import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentQueryDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysLinkService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysNoticeService;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 网站接口类，申请友链、评论、点赞等
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@RestController
@RequestMapping("/api")
public class RestApiController {

    @Autowired
    private SysLinkService sysLinkService;
    @Autowired
    private BizCommentService commentService;
    @Autowired
    private BizArticleService articleService;
    @Autowired
    private SysNoticeService noticeService;


    @PostMapping("/comments")
    public BaseResponse comments(CommentQueryDto vo) {
        vo.setStatus(CommentStatusEnum.APPROVED.toString());
        return ResultUtils.success(null, commentService.list(vo));
    }

    @PostMapping("/comment")
    public BaseResponse comment(CommentDto comment) {
        try {
            commentService.comment(comment);
        } catch (CommonRuntimeException e) {
            log.error("评论发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("评论发表成功，系统正在审核，请稍后刷新页面查看！");
    }

    @PostMapping("/doSupport/{id}")
    public BaseResponse doSupport(@PathVariable("id") String id) {
        try {
            commentService.doSupport(id);
        } catch (CommonRuntimeException e) {
            log.error("评论点赞发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("");
    }

    @PostMapping("/doOppose/{id}")
    public BaseResponse doOppose(@PathVariable("id") String id) {
        try {
            commentService.doOppose(id);
        } catch (CommonRuntimeException e) {
            log.error("评论点踩发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("");
    }

    @PostMapping("/doPraise/{id}")
    public BaseResponse doPraise(@PathVariable("id") String id) {
        try {
            articleService.doPraise(id);
        } catch (CommonRuntimeException e) {
            log.error("文章点赞发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("");
    }

    @PostMapping("/listNotice")
    public BaseResponse listNotice() {
        return ResultUtils.success("", noticeService.listRelease());
    }

}
