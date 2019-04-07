/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.biz.dto.TagsDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTagsService;
import com.github.peterchenhdu.site4j.biz.dto.req.TagsConditionVO;
import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.config.property.FrontPageConfig;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * 文章标签管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="标签管理", tags="文章管理")
@RestController
@RequestMapping("/admin/tag")
public class TagController {
    @Autowired
    private BizTagsService tagsService;
    @Autowired
    private FrontPageConfig frontPageConfig;
    @ApiOperation(value="路由到标签管理页面")
    @BusinessLog("进入标签列表页")
    @GetMapping("")
    public ModelAndView tags(Model model) {
        model.addAttribute("module", frontPageConfig.getFrontModule("tag"));
        return ResultUtils.view("admin/common-mgt");
    }

    @ApiOperation(value="查询标签列表")
    @PostMapping("/query")
    public BasePagingResultDto list(TagsConditionVO vo) {
        PageInfoDto<TagsDto> pageInfo = tagsService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增标签")
    @PostMapping(value = "/add")
    public BaseResponse add(TagsDto tags) {
        tagsService.insert(tags);
        return ResultUtils.success("标签添加成功！新标签 - " + tags.getName());
    }

    @ApiOperation(value="批量删除标签")
    @PostMapping(value = "/batchDelete")
    public BaseResponse batchDelete(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            tagsService.removeByPrimaryKey(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个标签");
    }

    @ApiOperation(value="删除单个标签")
    @PostMapping(value = "/delete")
    public BaseResponse delete(String id) {
        tagsService.removeByPrimaryKey(id);
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看单个标签")
    @PostMapping("/get/{id}")
    public BaseResponse get(@PathVariable String id) {
        return ResultUtils.success(null, this.tagsService.getByPrimaryKey(id));
    }

    @ApiOperation(value="更新标签")
    @PostMapping("/update")
    public BaseResponse edit(TagsDto tags) {

            tagsService.updateSelective(tags);

        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

//    @PostMapping("/listAll")
//    public Response listType() {
//        return ResultUtils.success(null, tagsService.listAll());
//    }

}
