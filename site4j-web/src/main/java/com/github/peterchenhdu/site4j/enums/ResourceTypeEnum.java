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
public enum ResourceTypeEnum {
    MENU("menu", "菜单"), BUTTON("button", "按钮");

    private String key;

    private String description;

    ResourceTypeEnum(String key, String description) {
        this.key = key;
        this.description = description;
    }

    public String getKey() {
        return key;
    }

    public String getDescription() {
        return description;
    }

    public static ResourceTypeEnum getByKey(String key) {
        for (ResourceTypeEnum e : ResourceTypeEnum.values()) {
            if (e.getKey().equals(key)) {
                return e;
            }
        }

        throw new RuntimeException("invalid key");
    }
}
