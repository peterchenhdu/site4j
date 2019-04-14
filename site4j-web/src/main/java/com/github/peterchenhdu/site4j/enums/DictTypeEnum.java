/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
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
