/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.admin.controller;

import club.peterchenhdu.biz.dto.ConfigDto;
import club.peterchenhdu.biz.entity.Image;
import club.peterchenhdu.biz.service.articlemgt.BizArticleService;
import club.peterchenhdu.biz.service.common.IImageService;
import club.peterchenhdu.biz.service.sitemgt.SysConfigService;
import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.enums.ImageType;
import club.peterchenhdu.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 公共接口
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@RestController
@Api(value = "API接口", description = "后台公共接口")
@RequestMapping("/admin/api")
public class AdminCommonController {

    @Autowired
    private BizArticleService articleService;
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
    @ApiOperation(value="上传文件")
    @PostMapping("/upload2TencentCos")
    public Response<String> upload2TencentCos(@RequestParam("file") MultipartFile file) {
        String filePath = imageService.uploadToTencentCos(file, ImageType.ARTICLE_IMAGE, false);
        return ResultUtils.success("图片上传成功", filePath);
    }


    @ApiOperation(value="上传文件到MD文档")
    @PostMapping("/upload2TencentCosForMd")
    public Map<String, Object> upload2TencentCosForMd(@RequestParam("file") MultipartFile file) {
        String filePath = imageService.uploadToTencentCos(file, ImageType.ARTICLE_IMAGE, false);
        ConfigDto config = configService.get();
        Map<String, Object> resultMap = new HashMap<>(3);
        resultMap.put("success", 1);
        resultMap.put("message", "上传成功");
        resultMap.put("filename", config.getQiuniuBasePath() + filePath);
        return resultMap;
    }

    /**
     * 发布文章选择图片时获取素材库
     *
     * @return Response
     */
    @ApiOperation(value="查询素材库")
    @PostMapping("/material")
    public Response<List<String>> material() {
        return ResultUtils.success("查询成功", articleService.listMaterial());
    }

    @ApiOperation(value="查询图片")
    @GetMapping("/queryImage")
    public Response<List<Image>> queryImage() {
        return ResultUtils.success("查询成功", imageService.query());
    }


}
