/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.annotation;

import com.github.peterchenhdu.site4j.common.constant.CommonConstants;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 记录业务日志，用户点击操作
 * <p>
 * Created by chenpi on 2018/10/21.
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface BusinessLog {
    /**
     * 业务的名称
     */
    String value() default CommonConstants.EMPTY_STRING;

    /**
     * 是否持久化到DB
     */
    boolean persistence() default false;

}
