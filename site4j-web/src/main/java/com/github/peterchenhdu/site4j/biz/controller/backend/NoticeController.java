/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.NoticeDto;
import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysNoticeService;
import com.github.peterchenhdu.site4j.biz.dto.req.NoticeQueryDto;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.enums.NoticeStatusEnum;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import com.github.peterchenhdu.site4j.util.SessionUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 公告
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Api(value="公告管理", tags="网站管理")
@RestController
@RequestMapping("/admin/notice")
public class NoticeController {
    @Autowired
    private SysNoticeService noticeService;

    @ApiOperation(value="路由到公告管理页面")
    @BusinessLog("进入系统通知页")
    @GetMapping("")
    public ModelAndView notices() {
        return ResultUtils.view("admin/notice/list");
    }

    @ApiOperation(value="查询公告")
    @PostMapping("/query")
    public BasePagingResultDto query(NoticeQueryDto vo) {
        PageInfoDto<NoticeDto> pageInfo = noticeService.query(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增公告")
    @PostMapping(value = "/add")
    public BaseResponse add(NoticeDto notice) {
        UserDto user = SessionUtil.getUser();
        if (null != user) {
            notice.setUserId(user.getId());
        }
        noticeService.save(notice);
        return ResultUtils.success("系统通知添加成功");
    }

    @ApiOperation(value="批量删除公告")
    @PostMapping(value = "/batchDelete")
    public BaseResponse batchDelete(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            noticeService.deleteById(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个系统通知");
    }

    @ApiOperation(value="单个删除公告")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        noticeService.deleteById(id);
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看单个公告")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.noticeService.queryById(id));
    }

    @ApiOperation(value="修改公告")
    @PostMapping("/update")
    public BaseResponse update(NoticeDto notice) {
        noticeService.updateSelective(notice);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    @ApiOperation(value="发布公告")
    @PostMapping("/publish/{id}")
    public BaseResponse release(@PathVariable String id) {
        NoticeDto notice = new NoticeDto();
        notice.setId(id);
        notice.setStatus(NoticeStatusEnum.RELEASE.toString());
        noticeService.updateSelective(notice);
        return ResultUtils.success("该通知已发布，可去前台页面查看效果！");
    }

    @ApiOperation(value="撤回公告")
    @PostMapping("/reCall/{id}")
    public BaseResponse withdraw(@PathVariable String id) {
        NoticeDto notice = new NoticeDto();
        notice.setId(id);
        notice.setStatus(NoticeStatusEnum.NOT_RELEASE.toString());
        noticeService.updateSelective(notice);
        return ResultUtils.success("该通知已撤回，可修改后重新发布！");
    }

}
