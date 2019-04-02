/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.TemplateDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysTemplateService;
import com.github.peterchenhdu.site4j.biz.dto.req.TemplateConditionVO;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.PageResult;
import com.github.peterchenhdu.site4j.common.base.Response;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.github.peterchenhdu.site4j.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 模板管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="模板管理", tags="网站管理")
@RestController
@RequestMapping("/admin/template")
public class RestTemplateController {
    @Autowired
    private SysTemplateService templateService;


    @ApiOperation(value="路由到模板管理页面")
    @BusinessLog("进入模板管理页")
    @GetMapping("")
    public ModelAndView templates() {
        return ResultUtils.view("admin/template/list");
    }

    @ApiOperation(value="查询模板")
    @PostMapping("/list")
    public PageResult list(TemplateConditionVO vo) {
        PageInfo<TemplateDto> pageInfo = templateService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增模板")
    @PostMapping(value = "/add")
    public Response add(TemplateDto template) {
        templateService.insert(template);
        return ResultUtils.success("成功");
    }

    @ApiOperation(value="删除模板")
    @PostMapping(value = "/remove")
    public Response remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            templateService.removeByPrimaryKey(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个模板");
    }

    @ApiOperation(value="查看单个模板")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.templateService.getByPrimaryKey(id));
    }

    @ApiOperation(value="编辑模板")
    @PostMapping("/edit")
    public Response edit(TemplateDto template) {
        try {
            templateService.updateSelective(template);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtils.error("模板修改失败！");
        }
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

}
