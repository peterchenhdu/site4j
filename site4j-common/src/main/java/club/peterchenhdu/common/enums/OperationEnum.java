/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.common.enums;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author PiChen
 * @since 2019/3/17
 */
public enum OperationEnum {
    ADD("add", "新增"),
    DELETE("delete", "删除"),
    UPDATE("update", "修改"),
    QUERY("query", "查询"),
    GET("get", "查看"),
    PUBLISH("publish", "发布"),
    RE_CALL("reCall", "撤回"),
    BATCH_DELETE("batchDelete", "批量删除"),
    ALLOT_RESOURCE("allotResource", "分配资源");
    private String key;
    private String description;

    OperationEnum(String key, String description) {
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
        return Arrays.stream(OperationEnum.values()).map(dto->{
            Map<String ,String> map = new HashMap<>();
            map.put("key", dto.getKey());
            map.put("description", dto.getDescription());
            return map;
        }).collect(Collectors.toList());
    }

    public static OperationEnum getByKey(String key) {
        for (OperationEnum e : OperationEnum.values()) {
            if (e.getKey().equals(key)) {
                return e;
            }
        }
        throw new RuntimeException("invalid key");
    }
}
