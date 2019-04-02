/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.aspect;

import com.github.peterchenhdu.site4j.common.annotation.PublicService;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * AOP切面记录日志(@BusinessLog注解)
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Slf4j
@Aspect
@Order(0)
@Component
public class AuthAspect {

    @Pointcut(value = "@annotation(org.springframework.web.bind.annotation.PostMapping) || " +
            "@annotation(org.springframework.web.bind.annotation.GetMapping)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object writeLog(ProceedingJoinPoint point) throws Throwable {

        HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        System.out.println("请求地址：" + req.getRequestURI());

        String uri = req.getRequestURI();

        MethodSignature joinPointObject = (MethodSignature) point.getSignature();
        Method method = joinPointObject.getMethod();
        Class<?> clazz = joinPointObject.getDeclaringType();
        boolean publicServiceFlag = clazz.isAnnotationPresent(PublicService.class);
        boolean requiresUserFlag = method.isAnnotationPresent(RequiresUser.class);
        boolean requiresPermissionsFlag = method.isAnnotationPresent(RequiresPermissions.class);

        if(publicServiceFlag || requiresUserFlag || requiresPermissionsFlag) {
            return point.proceed();
        } else if (ObjectUtils.isNotEmpty(uri) && uri.startsWith("/admin")) {
            //执行默认url拦截
            String[] arr = uri.split("/");
            if (arr.length == 3) {
                SecurityUtils.getSubject().checkPermissions(arr[2]);
            } else if (arr.length >= 4) {
                SecurityUtils.getSubject().checkPermissions(arr[2] + ":" + arr[3]);
            }
        }

        //执行业务
        return point.proceed();
    }

}
