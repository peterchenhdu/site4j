/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 角色类型
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public enum RoleTypeEnum {
    SUPER_ADMIN("super_admin", "超级管理员"),
    NORMAL_ADMIN("normal_admin", "普通管理员"),
    NORMAL_USER("normal_user", "普通用户");

    private String key;

    private String description;

    RoleTypeEnum(String key, String description) {
        this.key = key;
        this.description = description;
    }

    public String getKey() {
        return key;
    }

    public String getDescription() {
        return description;
    }

    public static RoleTypeEnum getByKey(String key) {
        for (RoleTypeEnum e : RoleTypeEnum.values()) {
            if (e.getKey().equals(key)) {
                return e;
            }
        }

        throw new RuntimeException("invalid key");
    }

    public static List<Map<String, String>> toList() {
        return Arrays.stream(RoleTypeEnum.values())
                .filter(dto -> !dto.getKey().equals(RoleTypeEnum.SUPER_ADMIN.key))
                .map(dto -> {
                    Map<String, String> map = new HashMap<>();
                    map.put("key", dto.getKey());
                    map.put("description", dto.getDescription());
                    return map;
                }).collect(Collectors.toList());
    }
}
