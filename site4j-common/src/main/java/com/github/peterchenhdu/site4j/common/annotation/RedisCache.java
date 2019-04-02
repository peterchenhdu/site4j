/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.annotation;

import java.lang.annotation.*;
import java.util.concurrent.TimeUnit;

/**
 * Redis缓存注解
 * <p>
 * Created by chenpi on 2018/10/21.
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface RedisCache {

    /**
     * 业务的名称
     */
    String value() default "";

    /**
     * redis缓存的Key（默认类名-方法名-自定义key）
     */
    String key() default "";

    /**
     * 是否刷新缓存，默认false
     */
    boolean flush() default false;

    /**
     * 缓存失效时间，默认30
     */
    long expire() default 30L;

    /**
     * 缓存时间单位，默认天
     */
    TimeUnit unit() default TimeUnit.DAYS;
}
