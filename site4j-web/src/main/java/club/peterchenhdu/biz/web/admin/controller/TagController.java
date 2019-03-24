/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.TagsDto;
import club.peterchenhdu.biz.service.articlemgt.BizTagsService;
import club.peterchenhdu.biz.web.vo.TagsConditionVO;
import club.peterchenhdu.common.annotation.BusinessLog;
import club.peterchenhdu.common.base.PageResult;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.enums.ResponseStatus;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.config.property.FrontPageConfig;
import club.peterchenhdu.util.ResultUtils;
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
@Api(value="标签管理")
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
    public PageResult list(TagsConditionVO vo) {
        PageInfo<TagsDto> pageInfo = tagsService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增标签")
    @PostMapping(value = "/add")
    public Response add(TagsDto tags) {
        tagsService.insert(tags);
        return ResultUtils.success("标签添加成功！新标签 - " + tags.getName());
    }

    @ApiOperation(value="批量删除标签")
    @PostMapping(value = "/batchDelete")
    public Response batchDelete(String[] ids) {
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
    public Response delete(String id) {
        tagsService.removeByPrimaryKey(id);
        return ResultUtils.success("成功删除");
    }

    @ApiOperation(value="查看单个标签")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.tagsService.getByPrimaryKey(id));
    }

    @ApiOperation(value="更新标签")
    @PostMapping("/update")
    public Response edit(TagsDto tags) {

            tagsService.updateSelective(tags);

        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

//    @PostMapping("/listAll")
//    public Response listType() {
//        return ResultUtils.success(null, tagsService.listAll());
//    }

}
