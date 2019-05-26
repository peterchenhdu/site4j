/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util.holder;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.Locale;

/**
 * 获取SpringContext相关
 * <p>
 * Created by chenpi on 2018/10/21.
 */
@Component
public class SpringContextHolder implements ApplicationContextAware {

    private static ApplicationContext appContext = null;

    /**
     * 通过name获取 Bean.
     *
     * @param name name
     * @return Object
     */
    public static Object getBean(String name) {
        return appContext.getBean(name);

    }

    /**
     * 通过class获取Bean.
     *
     * @param clazz clazz
     * @param <T> T
     * @return T
     */
    public static <T> T getBean(Class<T> clazz) {
        return appContext.getBean(clazz);
    }

    /**
     * 通过name,以及Clazz返回指定的Bean
     *
     * @param name name
     * @param clazz clazz
     * @param <T> T
     * @return T
     */
    public static <T> T getBean(String name, Class<T> clazz) {
        return appContext.getBean(name, clazz);
    }



    // 国际化使用
    public static String getMessage(String key) {
        return appContext.getMessage(key, null, Locale.getDefault());
    }


    /// 获取当前环境
    public static String getActiveProfile() {
        return appContext.getEnvironment().getActiveProfiles()[0];
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        if (appContext == null) {
            appContext = applicationContext;
        }
    }




    public static ApplicationContext getApplicationContext() {
        return appContext;
    }
}
