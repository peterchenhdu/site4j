/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public enum UserPrivacyEnum {
    PUBLIC(1, "公开"),
    PRIVATE(2, "不公开"),;
    private Integer code;
    private String desc;

    UserPrivacyEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static UserPrivacyEnum get(Integer code) {
        if (null == code) {
            return PUBLIC;
        }
        UserPrivacyEnum[] enums = UserPrivacyEnum.values();
        for (UserPrivacyEnum anEnum : enums) {
            if (anEnum.getCode().equals(code)) {
                return anEnum;
            }
        }
        return PUBLIC;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

}
