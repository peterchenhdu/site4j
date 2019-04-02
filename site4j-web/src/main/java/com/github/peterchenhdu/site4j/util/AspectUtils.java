/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;

import java.lang.reflect.Method;

/**
 * AOP相关的工具
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/6/29 11:59
 * @since 1.0
 */
public class AspectUtils {

    /**
     * 获取以类路径为前缀的键
     *
     * @param point 当前切面执行的方法
     */
    public static String getKeyOfClassPrefix(ProceedingJoinPoint point, String prefix) {
        String keyPrefix = "";
        if (ObjectUtils.isNotEmpty(prefix)) {
            keyPrefix += prefix;
        }
        keyPrefix += getClassName(point);
        return keyPrefix;
    }

    /**
     * 获取当前切面执行的方法所在的class
     *
     * @param point 当前切面执行的方法
     */
    public static String getClassName(ProceedingJoinPoint point) {
        return point.getTarget().getClass().getName().replaceAll("\\.", "_");
    }

    /**
     * 获取当前切面执行的方法的方法名
     *
     * @param point 当前切面执行的方法
     * @throws NoSuchMethodException
     */
    public static Method getMethod(ProceedingJoinPoint point) throws NoSuchMethodException {
        Signature sig = point.getSignature();
        MethodSignature msig = (MethodSignature) sig;
        Object target = point.getTarget();
        return target.getClass().getMethod(msig.getName(), msig.getParameterTypes());
    }

    /**
     * 获取切面缓存的key
     *
     * @param point  当前切面执行的方法
     * @param extra  额外的参数 （非必选）
     * @param prefix key前缀 （非必选）
     * @throws NoSuchMethodException
     */
    public static String getKey(ProceedingJoinPoint point, String extra, String prefix) throws NoSuchMethodException {
        Method currentMethod = AspectUtils.getMethod(point);
        String methodName = currentMethod.getName();
        return getKeyOfClassPrefix(point, prefix) + "_" + methodName +
                CacheKeyUtil.getMethodParamsKey(point.getArgs()) + (null == extra ? "" : extra);
    }
}
