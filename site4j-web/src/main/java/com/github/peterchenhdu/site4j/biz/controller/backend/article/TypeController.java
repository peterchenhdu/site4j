/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend.article;

import com.github.peterchenhdu.site4j.biz.dto.TypeDto;
import com.github.peterchenhdu.site4j.biz.dto.req.TypeQueryDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTypeService;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import com.github.peterchenhdu.site4j.config.property.FrontPageConfig;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.constraints.NotNull;

/**
 * 文章类型管理
 * <p>
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Api(value = "类型管理", tags = "文章管理")
@RestController
@RequestMapping("/admin/type")
@Validated
public class TypeController {
    @Autowired
    private BizTypeService typeService;
    @Autowired
    private FrontPageConfig frontPageConfig;

    @ApiOperation(value = "路由到分类管理页面")
    @BusinessLog("进入分类列表页")
    @GetMapping("")
    public ModelAndView types(Model model) {
        model.addAttribute("module", frontPageConfig.getFrontModule("type"));
        return ResultUtils.view("admin/article/type");
    }

    @ApiOperation(value = "查询类别")
    @PostMapping("/list")
    public BasePagingResultDto list(TypeQueryDto vo) {
        PageInfoDto<TypeDto> pageInfo = typeService.query(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value = "新增类别")
    @PostMapping(value = "/add")
    public BaseResponse add(TypeDto type) {
        typeService.save(type);
        return ResultUtils.success("文章类型添加成功！新类型 - " + type.getName());
    }

    @ApiOperation(value = "批量删除类别")
    @PostMapping(value = "/batchDelete")
    public BaseResponse batchDelete(@NotNull(message = "请至少选择一条记录") String[] ids) {
        for(String id:ids) {
            typeService.deleteById(id);
        }
        return ResultUtils.success("成功删除[" + ids.length + "]条记录");
    }

    @ApiOperation(value = "删除单个标签")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        typeService.deleteById(id);
        return ResultUtils.success("成功删除");
    }


    @ApiOperation(value = "查看单个类别")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.typeService.queryById(id));
    }

    @ApiOperation(value = "编辑类别")
    @PostMapping("/edit")
    public BaseResponse edit(TypeDto type) {
        typeService.updateSelective(type);
        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    @ApiOperation(value = "查看所有类别")
    @PostMapping("/listAll")
    public BaseResponse listType() {
        return ResultUtils.success(null, typeService.listAll());
    }

    @ApiOperation(value = "查看父类别")
    @PostMapping("/listParent")
    public BaseResponse listParent() {
        return ResultUtils.success(null, typeService.listParent());
    }

}
