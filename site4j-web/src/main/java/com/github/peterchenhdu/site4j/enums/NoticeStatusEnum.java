/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public enum NoticeStatusEnum {
    RELEASE("已发布"),
    NOT_RELEASE("未发布");
    private String desc;

    NoticeStatusEnum(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
