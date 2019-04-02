/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config;

import com.github.peterchenhdu.site4j.core.interceptor.RememberAuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/7/15 15:03
 * @since 1.0
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private RememberAuthenticationInterceptor rememberAuthenticationInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(rememberAuthenticationInterceptor)
                .excludePathPatterns("/admin/passport/**",
                                     "/admin/error/**",
                                     "/admin/getVerificationCode/**",
                                     "/admin/favicon.ico")
                .addPathPatterns("/admin/**");
    }
}
