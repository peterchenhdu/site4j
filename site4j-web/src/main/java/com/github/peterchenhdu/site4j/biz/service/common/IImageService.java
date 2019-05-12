/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common;

import com.github.peterchenhdu.site4j.biz.dto.req.ImageQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.Image;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.enums.ImageType;
import org.springframework.web.multipart.MultipartFile;

/**
 * 图片查询
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface IImageService {

    /**
     * 上传图片到腾讯云
     * @param file 文件
     * @param uploadType 文件类型
     * @return 图片UIRL
     */
    String uploadToTencentCos(MultipartFile file, ImageType uploadType);

    /**
     * 分页查询图片列表
     * @param vo 查询条件
     * @return 图片列表
     */
    PageInfoDto<Image> query(ImageQueryDto vo);
}
