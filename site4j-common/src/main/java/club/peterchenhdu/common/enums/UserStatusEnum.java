/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.enums;

/**
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public enum UserStatusEnum {
    NORMAL(1, "正常"),
    DISABLE(0, "禁用"),;
    private Integer key;
    private String description;

    UserStatusEnum(Integer key, String description) {
        this.key = key;
        this.description = description;
    }


    public static UserStatusEnum get(Integer code) {
        if (null == code) {
            return NORMAL;
        }
        UserStatusEnum[] enums = UserStatusEnum.values();
        for (UserStatusEnum anEnum : enums) {
            if (anEnum.getKey().equals(code)) {
                return anEnum;
            }
        }
        return NORMAL;
    }

    public Integer getKey() {
        return key;
    }

    public String getDescription() {
        return description;
    }
}
