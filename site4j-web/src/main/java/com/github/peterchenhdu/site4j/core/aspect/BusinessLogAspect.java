/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.aspect;

import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.util.RegexUtils;
import com.github.peterchenhdu.site4j.common.util.web.RequestUtils;
import com.github.peterchenhdu.site4j.util.AspectUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.List;

/**
 * AOP切面记录日志(@BusinessLog注解)
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Aspect
@Component
public class BusinessLogAspect {

    @Pointcut(value = "@annotation(com.github.peterchenhdu.site4j.common.annotation.BusinessLog)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object writeLog(ProceedingJoinPoint point) throws Throwable {

        //1、先执行业务
        Object result = point.proceed();

        //2、记录日志，捕获全部异常，不影响主程序执行
        try {
            handle(point);
        } catch (Exception e) {
            log.error("日志记录出错!", e);
        }

        return result;
    }

    /**
     * 记录业务日志
     * @param point ProceedingJoinPoint
     * @throws Exception Exception
     */
    private void handle(ProceedingJoinPoint point) throws Exception {
        //获取拦截方法的参数
        String className = AspectUtils.getClassName(point);
        Method currentMethod = AspectUtils.getMethod(point);
        //获取操作名称
        BusinessLog annotation = currentMethod.getAnnotation(BusinessLog.class);
        String businessName = parseContent(point.getArgs(), annotation.value());
        String ua = RequestUtils.getUa();

        log.info("{}-{}.{}", businessName, className, currentMethod.getName());
        log.info("IP: {}, Method: {}, Request URL: {}", RequestUtils.getIp(), RequestUtils.getMethod(), RequestUtils.getRequestUrl());
        log.info("User-Agent: " + ua);
    }


    @AfterThrowing(pointcut = "pointcut()", throwing = "ex")
    public void afterThrowing(JoinPoint joinPoint, Throwable ex) throws Throwable {
        log.error("捕获到了异常...", ex);
    }

    private String parseContent(Object[] params, String bussinessName) {
        if (bussinessName.contains("{") && bussinessName.contains("}")) {
            List<String> result = RegexUtils.getMatchList(bussinessName, "(?<=\\{)(\\d+)");
            for (String s : result) {
                int index = Integer.parseInt(s);
                bussinessName = bussinessName.replaceAll("\\{" + index + "\\}", String.valueOf(params[index - 1]));
            }
        }
        return bussinessName;
    }
}
