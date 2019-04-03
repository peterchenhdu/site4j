/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.biz.service.common.MailService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentConditionVO;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.enums.TemplateKeyEnum;
import com.github.peterchenhdu.site4j.common.exception.CommentException;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 评论管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="评论管理", tags="文章管理")
@RestController
@RequestMapping("/admin/comment")
public class RestCommentController {
    @Autowired
    private BizCommentService commentService;
    @Autowired
    private MailService mailService;

    @ApiOperation(value="路由到评论管理页面")
    @BusinessLog("进入评论页")
    @GetMapping("")
    public ModelAndView comments() {
        return ResultUtils.view("admin/comment/list");
    }

    @ApiOperation(value="查询评论")
    @PostMapping("/list")
    public BasePagingResultDto list(CommentConditionVO vo) {
        PageInfoDto<CommentDto> pageInfo = commentService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="回复评论")
    @PostMapping(value = "/reply")
    public BaseResponse reply(CommentDto comment) {
        try {
            commentService.commentForAdmin(comment);
        } catch (CommentException e) {
            return ResultUtils.error(e.getMessage());
        }
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="删除批量")
    @PostMapping(value = "/remove")
    public BaseResponse remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            commentService.removeByPrimaryKey(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 条评论");
    }

    @ApiOperation(value="查看评论")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.commentService.getByPrimaryKey(id));
    }

    @ApiOperation(value="编辑评论")
    @PostMapping("/edit")
    public BaseResponse edit(CommentDto comment) {
        try {
            commentService.updateSelective(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("评论修改失败！");
        }
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    /**
     * 审核
     *
     * @param comment
     * @return
     */
    @ApiOperation(value="修改评论")
    @PostMapping("/audit")
    public BaseResponse audit(CommentDto comment, String contentText, Boolean sendEmail) {
        try {
            commentService.updateSelective(comment);
            if (!StringUtils.isEmpty(contentText)) {
                comment.setContent(contentText);
                commentService.commentForAdmin(comment);
            }
            if (null != sendEmail && sendEmail) {
                CommentDto commentDB = commentService.getByPrimaryKey(comment.getId());
                mailService.send(commentDB, TemplateKeyEnum.TM_COMMENT_AUDIT, true);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("评论审核失败！");
        }
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    /**
     * 正在审核的
     *
     * @param comment
     * @return
     */
    @ApiOperation(value="查看未处理的评论")
    @PostMapping("/listVerifying")
    public BaseResponse listVerifying(CommentDto comment) {
        return ResultUtils.success(null, commentService.listVerifying(10));
    }

}
