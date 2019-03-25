/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.TypeDto;
import club.peterchenhdu.biz.service.articlemgt.BizTypeService;
import club.peterchenhdu.biz.web.vo.TypeConditionVO;
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
 * 文章类型管理
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Api(value="类型管理", tags="文章管理")
@RestController
@RequestMapping("/admin/type")
public class RestTypeController {
    @Autowired
    private BizTypeService typeService;
    @Autowired
    private FrontPageConfig frontPageConfig;
    @ApiOperation(value="路由到分类管理页面")
    @BusinessLog("进入分类列表页")
    @GetMapping("")
    public ModelAndView types(Model model) {
        model.addAttribute("module", frontPageConfig.getFrontModule("type"));
        return ResultUtils.view("admin/common-mgt");
    }

    @ApiOperation(value="查询类别")
    @PostMapping("/list")
    public PageResult list(TypeConditionVO vo) {
        PageInfo<TypeDto> pageInfo = typeService.findPageBreakByCondition(vo);
        return ResultUtils.tablePage(pageInfo);
    }

    @ApiOperation(value="新增类别")
    @PostMapping(value = "/add")
    public Response add(TypeDto type) {
        typeService.insert(type);
        return ResultUtils.success("文章类型添加成功！新类型 - " + type.getName());
    }

    @ApiOperation(value="删除类别")
    @PostMapping(value = "/remove")
    public Response remove(String[] ids) {
        if (null == ids) {
            return ResultUtils.error(500, "请至少选择一条记录");
        }
        for (String id : ids) {
            typeService.removeByPrimaryKey(id);
        }
        return ResultUtils.success("成功删除 [" + ids.length + "] 个文章类型");
    }

    @ApiOperation(value="查看单个类别")
    @PostMapping("/get/{id}")
    public Response get(@PathVariable String id) {
        return ResultUtils.success(null, this.typeService.getByPrimaryKey(id));
    }

    @ApiOperation(value="编辑类别")
    @PostMapping("/edit")
    public Response edit(TypeDto type) {
            typeService.updateSelective(type);

        return ResultUtils.success(ResponseStatus.SUCCESS);
    }

    @ApiOperation(value="查看所有类别")
    @PostMapping("/listAll")
    public Response listType() {
        return ResultUtils.success(null, typeService.listTypeForMenu());
    }

    @ApiOperation(value="查看父类别")
    @PostMapping("/listParent")
    public Response listParent() {
        return ResultUtils.success(null, typeService.listParent());
    }

}
