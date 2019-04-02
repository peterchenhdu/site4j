/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.enums;

/**
 * 图片类型
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public enum ImageType {
    QR_CODE_IMAGE("qr_code_image", "site4j/qrcode/", "二维码图片"),
    ARTICLE_IMAGE("article_image", "site4j/article/", "文章图片"),
    COVER_IMAGE("cover_image", "site4j/cover/", "封面图片");

    private String type;

    private String path;

    private String description;

    ImageType(String type, String path, String description) {
        this.type = type;
        this.path = path;
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public String getPath() {
        return path;
    }

    public String getDescription() {
        return description;
    }
}
