/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public enum DictTypeEnum {
    SYS_STAT("sys_stat", "系统统计"),
    SYS_CONFIG("sys_config", "系统配置");
    private String type;
    private String description;

    DictTypeEnum(String type, String description) {
        this.type = type;
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }
}
