/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.dto.ImageInfoDto;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

/**
 * 操作图片工具类
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ImageUtil {

    /**
     * 获取图片信息
     */
    public static ImageInfoDto getInfo(File file) {
        if (ObjectUtils.isEmpty(file)) {
            return null;
        }

        try {
            ImageInfoDto imageFileInfoDto = getInfo(new FileInputStream(file));
            imageFileInfoDto.setType(FileUtil.getSuffix(file.getName()));
            imageFileInfoDto.setFilename(file.getName());
            imageFileInfoDto.setSize(file.length());
            return imageFileInfoDto;
        } catch (FileNotFoundException e) {
            LogUtils.exception(e);
            throw new RuntimeException("获取图片信息失败");
        }
    }

    /**
     * 获取图片信息
     */
    public static ImageInfoDto getInfo(MultipartFile multipartFile) {
        if (ObjectUtils.isEmpty(multipartFile)) {
            return null;
        }

        try {
            ImageInfoDto imageFileInfoDto = getInfo(multipartFile.getInputStream());
            imageFileInfoDto.setType(FileUtil.getSuffix(multipartFile.getOriginalFilename()));
            imageFileInfoDto.setFilename(multipartFile.getOriginalFilename());
            imageFileInfoDto.setSize(multipartFile.getSize());
            return imageFileInfoDto;
        } catch (IOException e) {
            LogUtils.exception(e);
            throw new RuntimeException("获取图片信息失败");
        }
    }

    /**
     * 获取图片信息
     */
    public static ImageInfoDto getInfo(InputStream inputStream) {
        try (BufferedInputStream in = new BufferedInputStream(inputStream)) {
            BufferedImage bi = ImageIO.read(in);
            return new ImageInfoDto(bi.getWidth(), bi.getHeight());
        } catch (IOException e) {
            LogUtils.exception(e);
            throw new RuntimeException("获取图片信息失败");
        }
    }

    public static void main(String[] args) {
        File file = new File("C:\\Users\\chenpi5\\Pictures\\timg.png");


        System.out.println(getInfo(file));
    }
}
