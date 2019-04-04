/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.enums.ImageType;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.util.qcloud.TencentCosApi;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;

/**
 * 文件操作工具类
 *
 * @author chenpi
 * @since 2018/01/09 17:40
 */
@Slf4j
public class FileUtil {
    private static final String[] PICTURE_SUFFIX = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};


    public static String getSuffix(String fileName) {
        int idx = fileName.lastIndexOf(".");
        idx = idx == -1 ? fileName.length() : idx;
        return fileName.substring(idx);
    }

    private static boolean isPicture(String suffix) {
        return !StringUtils.isEmpty(suffix) && Arrays.asList(PICTURE_SUFFIX).contains(suffix.toLowerCase());
    }


    public static String uploadToTencentCos(MultipartFile file, ImageType uploadType, boolean canBeNull) {
        // 不可为空并且file为空，抛出异常
        if (!canBeNull && null == file) {
            throw new CommonRuntimeException("请选择图片");
        }
        // 可为空并且file为空，忽略后边的代码，返回null
        if (canBeNull && null == file) {
            return null;
        }

        try {
            String filePath;
            if (isPicture(getSuffix(file.getOriginalFilename()))) {

                filePath = TencentCosApi.getInstance()
                        .upload(file.getInputStream(), file.getSize(), file.getOriginalFilename(), uploadType);
                return filePath;
            } else {
                throw new CommonRuntimeException("只支持图片");
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new CommonRuntimeException("上传图片到腾讯云发生异常，请检查腾讯配置是否正常");
        }
    }

    /**
     * 删除腾讯上的文件
     *
     * @param keys 腾讯云文件的key（上传成功时返回的文件路径）
     * @return
     */
    public static int removeQiniu(String... keys) {
        if (null == keys || keys.length == 0) {
            return 0;
        }
        int count = 0;
        for (String key : keys) {
            // 不可为空并且file为空，抛出异常
            if (StringUtils.isEmpty(key)) {
                log.error("删除腾讯文件失败:文件key为空");
                continue;
            }
            try {
                boolean result = TencentCosApi.getInstance().delete(key);
                if (result) {
                    count++;
                }
            } catch (Exception e) {
                log.error("删除腾讯云文件发生异常", e);
            }
        }
        return count;
    }
}
