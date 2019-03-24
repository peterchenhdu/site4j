/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * BusinessLog
 *
 * @author PiChen
 * @since 2018/10/21
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface BusinessLog {
    /**
     * 业务的名称
     */
    String value() default "";

}
