/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.api;

import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ImageQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.Image;
import com.github.peterchenhdu.site4j.biz.service.common.IImageService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.PublicService;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import com.github.peterchenhdu.site4j.enums.ImageType;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 公共接口
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@PublicService
@RestController
@RequestMapping("/admin/api")
public class AdminCommonController {

    @Autowired
    private SysConfigService configService;
    @Autowired
    private IImageService imageService;

    /**
     * 上传文件到腾讯云
     *
     * @param file 文件
     * @return 相对URL路径
     */
    @ApiOperation(value = "上传文件")
    @PostMapping("/upload2TencentCos")
    public BaseResponse<String> upload2TencentCos(@RequestParam("file") MultipartFile file) {
        String filePath = imageService.uploadToTencentCos(file, ImageType.ARTICLE_IMAGE);
        return ResultUtils.success("图片上传成功", filePath);
    }


    @ApiOperation(value = "上传文件到MD文档")
    @PostMapping("/upload2TencentCosForMd")
    public Map<String, Object> upload2TencentCosForMd(@RequestParam("file") MultipartFile file) {
        String filePath = imageService.uploadToTencentCos(file, ImageType.ARTICLE_IMAGE);
        ConfigDto config = configService.get();
        Map<String, Object> resultMap = new HashMap<>(3);
        resultMap.put("success", 1);
        resultMap.put("message", "上传成功");
        resultMap.put("filename", config.getTencentCosBasePath() + filePath);
        return resultMap;
    }

    /**
     * 发布文章选择图片时获取素材库
     *
     * @return Response
     */
    @ApiOperation(value = "查询素材库")
    @PostMapping("/material")
    public BaseResponse<List<String>> material() {
        ImageQueryDto imageQueryDto = new ImageQueryDto();
        imageQueryDto.setPageSize(Integer.MAX_VALUE);
        return ResultUtils.success("查询成功", imageService.query(imageQueryDto).getList().stream().map(Image::getUrl).collect(Collectors.toList()));
    }
    
}
