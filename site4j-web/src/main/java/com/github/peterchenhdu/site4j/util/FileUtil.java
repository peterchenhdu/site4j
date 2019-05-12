/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.enums.ImageType;
import com.github.peterchenhdu.site4j.util.qcloud.TencentCosUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;

/**
 * 文件操作工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
public class FileUtil {
    private static final String[] PICTURE_SUFFIX = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};


    /**
     * 获取文件名的后缀名
     *
     * @param fileName 文件名
     * @return 后缀
     */
    public static String getSuffix(String fileName) {
        int idx = fileName.lastIndexOf(".");
        idx = idx == -1 ? fileName.length() : idx;
        return fileName.substring(idx);
    }

    /**
     * 判断后缀名是否为图片格式
     *
     * @param suffix 文件后缀
     * @return 是否是图片
     */
    private static boolean isPicture(String suffix) {
        return ObjectUtils.isNotEmpty(suffix) && Arrays.asList(PICTURE_SUFFIX).contains(suffix.toLowerCase());
    }


    /**
     * 上传图片到腾讯云
     *
     * @param file       文件
     * @param uploadType 图片类型
     * @return 图片url
     */
    public static String uploadToTencentCos(MultipartFile file, ImageType uploadType) {
        // 不可为空并且file为空，抛出异常
        if (null == file) {
            throw new CommonRuntimeException("请选择图片");
        }

        if (!isPicture(getSuffix(file.getOriginalFilename()))) {
            throw new CommonRuntimeException("只支持图片");
        }

        try {
            return TencentCosUtils.getInstance().upload(file, uploadType);
        } catch (Exception e) {
            LogUtils.exception(e);
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
                boolean result = TencentCosUtils.getInstance().delete(key);
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
