/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.dto;

/**
 * 图像信息DTO
 * <p>
 * Created by chenpi on 2018/04/16.
 */
public class ImageInfoDto {
    private long size;
    private String type;
    private int width;
    private int height;
    private String filename;

    public ImageInfoDto() {
    }

    public ImageInfoDto(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Override
    public String toString() {
        return "ImageFileInfoDto{" +
                "size=" + size +
                ", type='" + type + '\'' +
                ", width=" + width +
                ", height=" + height +
                ", filename='" + filename + '\'' +
                '}';
    }
}
