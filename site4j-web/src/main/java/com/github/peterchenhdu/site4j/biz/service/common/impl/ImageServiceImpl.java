/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.peterchenhdu.site4j.biz.dto.req.ImageQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.Image;
import com.github.peterchenhdu.site4j.biz.mapper.ImageMapper;
import com.github.peterchenhdu.site4j.biz.service.common.IImageService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.enums.ImageType;
import com.github.peterchenhdu.site4j.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 图片服务
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class ImageServiceImpl implements IImageService {
    @Autowired
    private ImageMapper imageMapper;
    @Autowired
    private SysConfigService configService;

    /**
     * 上传图片到腾讯云
     *
     * @param file       文件
     * @param uploadType 文件类型
     * @return 图片UIRL
     */
    @Override
    public String uploadToTencentCos(MultipartFile file, ImageType uploadType) {
        String imageUrl = FileUtil.uploadToTencentCos(file, uploadType);
        Image image = new Image();
        image.setUrl(configService.get().getTencentCosBasePath() + imageUrl);
        imageMapper.insert(image);
        return imageUrl;
    }

    /**
     * 分页查询图片列表
     *
     * @param vo 查询条件
     * @return 图片列表
     */
    @Override
    public PageInfoDto<Image> query(ImageQueryDto vo) {
        Page<Image> page = PageUtils.getPage(vo);
        List<Image> list = imageMapper.selectPage(PageUtils.getPage(vo), new EntityWrapper<>());
        return PageUtils.getPageInfo(page, list);
    }
}
