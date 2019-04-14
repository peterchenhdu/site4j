/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.aspect;

import com.github.peterchenhdu.site4j.biz.service.common.RedisService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.util.AspectUtils;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * Redis业务层数据缓存
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Aspect
@Component
public class RedisCacheAspect {

    private static final String BIZ_CACHE_PREFIX = "biz_cache_";

    @Autowired
    private RedisService redisService;

    @Pointcut(value = "@annotation(com.github.peterchenhdu.site4j.common.annotation.RedisCache)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object handle(ProceedingJoinPoint point) throws Throwable {
        Method currentMethod = AspectUtils.getMethod(point);
        //获取操作名称
        RedisCache cache = currentMethod.getAnnotation(RedisCache.class);
        boolean flush = cache.flush();
        if (flush) {
            String classPrefix = AspectUtils.getKeyOfClassPrefix(point, BIZ_CACHE_PREFIX);
            log.info("清空缓存 - {}*", classPrefix);
            redisService.delBatch(classPrefix);
            return point.proceed();
        }
        String key = AspectUtils.getKey(point, cache.key(), BIZ_CACHE_PREFIX);
        boolean hasKey = redisService.hasKey(key);
        if (hasKey) {
            try {
                log.info("{}从缓存中获取数据", key);
                return redisService.get(key);
            } catch (Exception e) {
                log.error("从缓存中获取数据失败！", e);
            }
        }
        //先执行业务
        Object result = point.proceed();
        redisService.set(key, result, cache.expire(), cache.unit());
        log.info("{}从数据库中获取数据", key);
        return result;
    }
}
