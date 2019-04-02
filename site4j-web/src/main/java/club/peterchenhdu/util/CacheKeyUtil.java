/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.util;

import club.peterchenhdu.common.dto.ImageFileInfoDto;
import club.peterchenhdu.common.util.JacksonUtils;
import org.springframework.util.StringUtils;
import org.springframework.validation.support.BindingAwareModelMap;

/**
 * 缓存key相关的工具类
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/5/25 10:23
 * @since 1.0
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
            key.append(JacksonUtils.obj2json(obj).replaceAll("\"", "'"));
        }
        key.append(")");
        return key.toString();
    }


    public static void main(String[] args) {
        System.out.println(getMethodParamsKey("123", new ImageFileInfoDto(5,6)));
    }

}
