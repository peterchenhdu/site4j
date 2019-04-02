/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.aspect;

import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.*;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.Properties;


/**
 * 公共字段持久化拦截器
 *
 * @author chenpi
 * @since 2018年1月19日
 */
@Intercepts({@Signature(type = Executor.class, method = "update", args = {MappedStatement.class, Object.class})})
@Component
public class MybatisInterceptor implements Interceptor {

    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        SqlCommandType commandType = SqlCommandType.UNKNOWN;
        Object[] args = invocation.getArgs();

        for (Object arg : args) {
            if (arg != null && arg instanceof MappedStatement) {
                MappedStatement ms = (MappedStatement) arg;
                SqlCommandType sqlCommandType = ms.getSqlCommandType();
                if (sqlCommandType == SqlCommandType.INSERT || sqlCommandType == SqlCommandType.UPDATE) {
                    commandType = sqlCommandType;
                } else {
                    //只处理插入和删除
                    break;
                }
            } else {
                if (SqlCommandType.UNKNOWN == commandType || arg == null) {
                    continue;
                }
                LocalDateTime currentDate = LocalDateTime.now();
                updateCommonFiled(arg, "UpdateTime", currentDate, LocalDateTime.class);
                if (SqlCommandType.INSERT == commandType) {
                    updateCommonFiled(arg, "Id", UuidUtils.getUuid(), String.class);
                    updateCommonFiled(arg, "CreateTime", currentDate, LocalDateTime.class);
                }
            }
        }
        return invocation.proceed();
    }


    private void updateCommonFiled(Object entity, String filedName, Object filedValue, Class<?> fieldClazz) {
        Class<? extends Object> entityClazz = entity.getClass();
        try {
            Method getFiled = entityClazz.getMethod("get" + filedName);
            Method setFiled = entityClazz.getMethod("set" + filedName, fieldClazz);
            Object value = getFiled.invoke(entity);
            if (ObjectUtils.isEmpty(value)) {
                setFiled.invoke(entity, filedValue);
            }
        } catch (Throwable e) {
            LogUtils.info(String.format("Java反射调用失败,调用类%s中没有 get%s或 set%s方法", entityClazz.getName(), filedName, filedName));
        }
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {
        // Do nothing
    }
}
