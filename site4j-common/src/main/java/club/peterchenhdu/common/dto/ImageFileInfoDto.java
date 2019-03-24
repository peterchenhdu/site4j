/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode
public class ImageFileInfoDto {
    public long size;
    public String type;
    public int width;
    public int height;
    public String filename;

    public ImageFileInfoDto() {
    }

    public ImageFileInfoDto(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public ImageFileInfoDto withSize(long size) {
        this.size = size;
        return this;
    }

    public ImageFileInfoDto withType(String type) {
        this.type = type;
        return this;
    }

    public ImageFileInfoDto withWidth(int width) {
        this.width = width;
        return this;
    }

    public ImageFileInfoDto withHeight(int height) {
        this.height = height;
        return this;
    }

    public ImageFileInfoDto withFilename(String filename) {
        this.filename = filename;
        return this;
    }
}
