/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.dto;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ImageFileInfoDto {
    private long size;
    private String type;
    private int width;
    private int height;
    private String filename;

    public ImageFileInfoDto() {
    }

    public ImageFileInfoDto(int width, int height) {
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
