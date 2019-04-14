/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public enum LinkSourceEnum {

    AUTOMATIC("自动申请"),
    ADMIN("管理员添加"),
    OTHER("其他");
    private String desc;

    LinkSourceEnum(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
