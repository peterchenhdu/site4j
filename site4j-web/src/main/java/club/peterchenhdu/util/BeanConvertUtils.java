/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.util;

import club.peterchenhdu.common.exception.BaseRuntimeException;
import org.springframework.beans.BeanUtils;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
 */
public class BeanConvertUtils {

    /**
     * source --> target 的转换
     *
     * @param source 被转换的对象
     * @param target 转换成的对象
     * @param <T>
     * @return
     */
    public static <T> T doConvert(Object source, Class<T> target) {
        if (null == source || null == target) {
            return null;
        }
        try {
            T t = target.newInstance();
            BeanUtils.copyProperties(source, t);
            return t;
        } catch (InstantiationException e) {
            throw new BaseRuntimeException(target + " - 可能为一个抽象类、接口、数组类、基本类型或者该类缺少无参构造方法！", e);
        } catch (IllegalAccessException e) {
            throw new BaseRuntimeException(target + " - 该类或其构造方法是不可访问的，或该类缺少无参构造方法！", e);
        }
    }

}
