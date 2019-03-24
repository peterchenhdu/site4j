/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 公共服务，不会被拦截进行权限校验的服务
 *
 * @author PiChen
 * @since 2019/3/22
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface PublicService {
}
