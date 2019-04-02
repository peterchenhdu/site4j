/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common.impl;

import com.github.peterchenhdu.site4j.biz.entity.Image;
import com.github.peterchenhdu.site4j.biz.mapper.ImageMapper;
import com.github.peterchenhdu.site4j.biz.service.common.IImageService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.enums.ImageType;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.util.FileUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author PiChen
 * @since 2019/2/11
 */
@Service
public class ImageServiceImpl implements IImageService {
    @Autowired
    private ImageMapper imageMapper;
    @Autowired
    private SysConfigService configService;

    @Transactional
    @Override
    public String uploadToTencentCos(MultipartFile file, ImageType uploadType, boolean canBeNull) {
        String filePath = FileUtil.uploadToTencentCos(file, uploadType, canBeNull);

        Image image = new Image();
        image.setId(UuidUtils.getUuid());
        image.setCreateTime(LocalDateTime.now());
        image.setUpdateTime(image.getCreateTime());
        image.setUrl(configService.get().getQiuniuBasePath() + filePath);
        imageMapper.insert(image);

        return filePath;
    }

    @Override
    public List<Image> query() {
        return imageMapper.selectList(new EntityWrapper<>());
    }
}
