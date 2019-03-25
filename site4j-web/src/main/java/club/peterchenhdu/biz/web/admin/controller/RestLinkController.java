/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.LinkDto;
import club.peterchenhdu.biz.service.common.MailService;
import club.peterchenhdu.biz.service.sitemgt.SysLinkService;
import club.peterchenhdu.biz.web.vo.LinkConditionVO;
import club.peterchenhdu.common.annotation.BusinessLog;
import club.peterchenhdu.common.base.PageResult;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.enums.LinkSourceEnum;
import club.peterchenhdu.common.enums.ResponseStatus;
import club.peterchenhdu.common.enums.TemplateKeyEnum;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 友情链接
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="友情链接管理", tags="网站管理")
@RestController
@RequestMapping("/admin/link")
public class RestLinkController {
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
    public PageResult list(LinkConditionVO vo) {
        PageInfo<LinkDto> pageInfo = linkService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增友情链接")
    @PostMapping(value = "/add")
    public Response add(LinkDto link) {
        link.setSource(LinkSourceEnum.ADMIN);
        linkService.insert(link);
        mailService.send(link, TemplateKeyEnum.TM_LINKS);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="删除友情链接")
    @PostMapping(value = "/remove")
    public Response remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            linkService.removeByPrimaryKey(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个友情链接");
    }

    @ApiOperation(value="查看单个友情链接")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.linkService.getByPrimaryKey(id));
    }

    @ApiOperation(value="编辑友情链接")
    @PostMapping("/edit")
    public Response edit(LinkDto link) {
        try {
            linkService.updateSelective(link);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("友情链接修改失败！");
        }
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

}
