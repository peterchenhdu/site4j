/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.controller.backend.sysmgt;

import com.github.peterchenhdu.site4j.biz.dto.req.ImageQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.Image;
import com.github.peterchenhdu.site4j.biz.service.common.IImageService;
import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 图片资源管理
 * <p>
 * Created by PiChen on 2019/5/12.
 */
@Api(value="图片资源管理", tags="网站管理")
@RestController
@RequestMapping("/admin/image")
public class ImageController {
    @Autowired
    private IImageService imageService;

    @ApiOperation(value="查看图片列表")
    @PostMapping("/list")
    public BasePagingResultDto list(ImageQueryDto vo) {
        PageInfoDto<Image> pageInfo = imageService.query(vo);
        return ResultUtils.tablePage(pageInfo);
    }
}
