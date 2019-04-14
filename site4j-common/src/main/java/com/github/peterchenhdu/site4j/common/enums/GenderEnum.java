/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.enums;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public enum GenderEnum {
    MALE(1, "男"), FEMALE(0, "女"), UN_KNOW(-1, "");
    private int code;
    private String desc;

    GenderEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static GenderEnum getUserSex(Integer code) {
        if (code == null) {
            return UN_KNOW;
        }
        for (GenderEnum userSexEnum : GenderEnum.values()) {
            if (userSexEnum.getCode() == code) {
                return userSexEnum;
            }
        }
        return UN_KNOW;
    }

    public static GenderEnum getUserSex(String code) {
        if (code == null) {
            return UN_KNOW;
        }
        if ("m".equals(code)) {
            return MALE;
        }
        if ("f".equals(code)) {
            return FEMALE;
        }
        return UN_KNOW;
    }

    public int getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
