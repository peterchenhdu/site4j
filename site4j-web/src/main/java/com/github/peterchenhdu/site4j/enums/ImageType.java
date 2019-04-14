/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * 图片类型
 * <p>
 * Created by chenpi on 2019/02/05.
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
