/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.dto.ImageInfoDto;
import com.github.peterchenhdu.site4j.common.util.JsonUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.support.BindingAwareModelMap;

/**
 * 缓存key相关的工具类
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class CacheKeyUtil {

    /**
     * 获取方法参数组成的key
     *
     * @param params 参数数组
     */
    public static String getMethodParamsKey(Object... params) {
        if (StringUtils.isEmpty(params)) {
            return "";
        }
        StringBuilder key = new StringBuilder("(");
        for (Object obj : params) {
            if (obj.getClass().equals(BindingAwareModelMap.class)) {
                continue;
            }
            key.append(JsonUtils.obj2json(obj).replaceAll("\"", "'"));
        }
        key.append(")");
        return key.toString();
    }


    public static void main(String[] args) {
        System.out.println(getMethodParamsKey("123", new ImageInfoDto(5,6)));
    }

}
