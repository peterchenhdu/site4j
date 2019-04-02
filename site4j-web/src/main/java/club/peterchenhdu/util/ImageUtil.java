/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.util;

import club.peterchenhdu.common.dto.ImageFileInfoDto;
import club.peterchenhdu.common.util.LogUtils;
import club.peterchenhdu.common.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;

/**
 * 操作图片工具类
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/18 11:48
 * @since 1.0
 */
public class ImageUtil {

    /**
     * 获取图片信息
     */
    public static ImageFileInfoDto getInfo(File file) {
        if (ObjectUtils.isEmpty(file)) {
            return null;
        }

        try {
            ImageFileInfoDto imageFileInfoDto = getInfo(new FileInputStream(file));
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
    public static ImageFileInfoDto getInfo(MultipartFile multipartFile) {
        if (ObjectUtils.isEmpty(multipartFile)) {
            return null;
        }

        try {
            ImageFileInfoDto imageFileInfoDto = getInfo(multipartFile.getInputStream());
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
    public static ImageFileInfoDto getInfo(InputStream inputStream) {
        try (BufferedInputStream in = new BufferedInputStream(inputStream)) {
            BufferedImage bi = ImageIO.read(in);
            return new ImageFileInfoDto(bi.getWidth(), bi.getHeight());
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
