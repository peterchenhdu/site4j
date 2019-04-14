/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import org.springframework.beans.BeanUtils;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class BeanConvertUtils {

    /**
     * source --> target 的转换
     *
     * @param source 被转换的对象
     * @param target 转换成的对象
     * @param <T> T
     * @return T
     */
    public static <T> T doConvert(Object source, Class<T> target) {
        if (ObjectUtils.isEmpty(source) || ObjectUtils.isEmpty(target)) {
            return null;
        }

        try {
            T targetInstance = target.newInstance();
            BeanUtils.copyProperties(source, targetInstance);
            return targetInstance;
        } catch (InstantiationException | IllegalAccessException e) {
            LogUtils.exception(e);
            throw new CommonRuntimeException("对象转换失败");
        }
    }

}
