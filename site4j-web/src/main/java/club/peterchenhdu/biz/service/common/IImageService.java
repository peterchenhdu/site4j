/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.service.common;

import club.peterchenhdu.biz.entity.Image;
import club.peterchenhdu.common.enums.ImageType;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/2/11
 */
public interface IImageService {

    String uploadToTencentCos(MultipartFile file, ImageType uploadType, boolean canBeNull);

    List<Image> query();
}
