/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.common;

import com.github.peterchenhdu.site4j.biz.entity.Image;
import com.github.peterchenhdu.site4j.enums.ImageType;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface IImageService {

    String uploadToTencentCos(MultipartFile file, ImageType uploadType, boolean canBeNull);

    List<Image> query();
}
