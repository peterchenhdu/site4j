/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.util;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * 对象工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ObjectUtils {
    private ObjectUtils() {
        throw new IllegalStateException("Utility class");
    }

    /**
     * if null , size = 0 or length = 0
     *
     * @param obj obj
     * @return boolean
     */
    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        }
        if (obj.getClass().isArray()) {
            return Array.getLength(obj) == 0;
        }
        if (obj instanceof CharSequence) {
            return ((CharSequence) obj).length() == 0;
        }
        if (obj instanceof Collection) {
            return ((Collection) obj).isEmpty();
        }
        if (obj instanceof Map) {
            return ((Map) obj).isEmpty();
        }
        // else
        return false;
    }

    /**
     * if not null , size != 0 or length != 0
     *
     * @param obj obj
     * @return boolean
     */
    public static boolean isNotEmpty(Object obj) {
        return !isEmpty(obj);
    }

    public static Map<String, Object> bean2Map(Object obj) {
        if (ObjectUtils.isEmpty(obj)) {
            return Collections.emptyMap();
        }

        try {
            PropertyDescriptor[] propertyDescriptors = Introspector.getBeanInfo(obj.getClass()).getPropertyDescriptors();
            Map<String, Object> map = new HashMap<>();
            for (PropertyDescriptor p : propertyDescriptors) {
                if ("class".equals(p.getName())) {
                    continue;
                }
                map.put(p.getName(), p.getReadMethod().invoke(obj));
            }
            return map;
        } catch (IntrospectionException | IllegalAccessException | InvocationTargetException e) {
            LogUtils.exception(e);
            throw new RuntimeException("对象转map失败");
        }

    }

}
