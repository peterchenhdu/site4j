/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.enums;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public enum UserNotificationEnum {
    DETAIL(1, "通知显示消息详情"),
    TITLE(2, "通知不显示消息详情"),;
    private Integer code;
    private String desc;

    UserNotificationEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static UserNotificationEnum get(Integer code) {
        if (null == code) {
            return DETAIL;
        }
        UserNotificationEnum[] enums = UserNotificationEnum.values();
        for (UserNotificationEnum anEnum : enums) {
            if (anEnum.getCode().equals(code)) {
                return anEnum;
            }
        }
        return DETAIL;
    }

    public Integer getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }
}
