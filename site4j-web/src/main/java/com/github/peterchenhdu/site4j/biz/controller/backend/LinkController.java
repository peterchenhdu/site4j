/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.LinkDto;
import com.github.peterchenhdu.site4j.biz.service.common.MailService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysLinkService;
import com.github.peterchenhdu.site4j.biz.dto.req.LinkQueryDto;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.enums.LinkSourceEnum;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 友情链接
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Api(value="友情链接管理", tags="网站管理")
@RestController
@RequestMapping("/admin/link")
public class LinkController {
    @Autowired
    private SysLinkService linkService;
    @Autowired
    private MailService mailService;

    @ApiOperation(value="路由到友情链接管理页面")
    @BusinessLog("进入链接页")
    @GetMapping("")
    public ModelAndView links() {
        return ResultUtils.view("admin/link/list");
    }

    @ApiOperation(value="查看友情链接")
    @PostMapping("/list")
    public BasePagingResultDto list(LinkQueryDto vo) {
        PageInfoDto<LinkDto> pageInfo = linkService.query(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增友情链接")
    @PostMapping(value = "/add")
    public BaseResponse add(LinkDto link) {
        link.setSource(LinkSourceEnum.ADMIN);
        linkService.save(link);
        mailService.send(link, TemplateKeyEnum.LINKS);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="删除友情链接")
    @PostMapping(value = "/remove")
    public BaseResponse remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            linkService.deleteById(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个友情链接");
    }

    @ApiOperation(value="查看单个友情链接")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.linkService.queryById(id));
    }

    @ApiOperation(value="编辑友情链接")
    @PostMapping("/edit")
    public BaseResponse edit(LinkDto link) {
        linkService.updateSelective(link);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

}
