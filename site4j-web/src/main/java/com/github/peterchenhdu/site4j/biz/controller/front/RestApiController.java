/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.front;

import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.biz.dto.LinkDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysNoticeService;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.common.exception.ArticleException;
import com.github.peterchenhdu.site4j.common.exception.CommentException;
import com.github.peterchenhdu.site4j.common.exception.LinkException;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysLinkService;
import com.github.peterchenhdu.site4j.common.util.JsonUtils;
import com.github.peterchenhdu.site4j.util.ResultUtils;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentConditionVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 网站接口类，申请友链、评论、点赞等
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
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

    @PostMapping("/autoLink")
    public BaseResponse autoLink(@Validated LinkDto link, BindingResult bindingResult) {
        log.info("申请友情链接......");
        log.info(JsonUtils.obj2json(link));
        if (bindingResult.hasErrors()) {
            return ResultUtils.error(bindingResult.getFieldError().getDefaultMessage());
        }
        try {
            sysLinkService.autoLink(link);
        } catch (LinkException e) {
            log.error("客户端自助申请友链发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("已成功添加友链，祝您生活愉快！");
    }



    @PostMapping("/comments")
    public BaseResponse comments(CommentConditionVO vo) {
        vo.setStatus(CommentStatusEnum.APPROVED.toString());
        return ResultUtils.success(null, commentService.list(vo));
    }

    @PostMapping("/comment")
    public BaseResponse comment(CommentDto comment) {
        try {
            commentService.comment(comment);
        } catch (CommentException e) {
            log.error("评论发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("评论发表成功，系统正在审核，请稍后刷新页面查看！");
    }

    @PostMapping("/doSupport/{id}")
    public BaseResponse doSupport(@PathVariable("id") String id) {
        try {
            commentService.doSupport(id);
        } catch (CommentException e) {
            log.error("评论点赞发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("");
    }

    @PostMapping("/doOppose/{id}")
    public BaseResponse doOppose(@PathVariable("id") String id) {
        try {
            commentService.doOppose(id);
        } catch (CommentException e) {
            log.error("评论点踩发生异常", e);
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("");
    }

    @PostMapping("/doPraise/{id}")
    public BaseResponse doPraise(@PathVariable("id") String id) {
        try {
            articleService.doPraise(id);
        } catch (ArticleException e) {
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
