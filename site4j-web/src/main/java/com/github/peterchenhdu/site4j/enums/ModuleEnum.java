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
 * @author PiChen
 * @since 2019/3/16
 */
public enum ModuleEnum {
    RESOURCE("resource", "资源"),
    USER("user", "用户"),
    ROLE("role", "角色"),
    NOTICE("notice", "公告"),
    TAG("tag", "标签"),
    PAGE("page", "页面"),
    ARTICLE("article", "文章");
    private String key;
    private String description;

    ModuleEnum(String key, String description) {
        this.key = key;
        this.description = description;
    }

    public String getKey() {
        return key;
    }

    public String getDescription() {
        return description;
    }

    public static List<Map<String, String>> toList() {
        return Arrays.stream(ModuleEnum.values()).map(dto->{
            Map<String ,String> map = new HashMap<>();
            map.put("key", dto.getKey());
            map.put("description", dto.getDescription());
            return map;
         }).collect(Collectors.toList());
    }

    public static ModuleEnum getByKey(String key) {
        for (ModuleEnum e : ModuleEnum.values()) {
            if (e.getKey().equals(key)) {
                return e;
            }
        }
        throw new RuntimeException("invalid key");
    }

}
