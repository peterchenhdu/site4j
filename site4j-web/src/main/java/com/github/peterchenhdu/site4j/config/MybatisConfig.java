/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config;

import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import com.github.peterchenhdu.site4j.common.constant.CommonConstants;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Configuration
@MapperScan("com.github.peterchenhdu.site4j.biz.mapper")
public class MybatisConfig {
    /**
     * mybatis-plus分页插件<br>
     * 文档：http://mp.baomidou.com<br>
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        return paginationInterceptor;
    }

    @Profile(CommonConstants.PROFILE_DEV)
    @Bean
    public PerformanceInterceptor performanceInterceptor() {
        PerformanceInterceptor performanceInterceptor = new PerformanceInterceptor();
        performanceInterceptor.setMaxTime(1000);
        performanceInterceptor.setFormat(true);
        return performanceInterceptor;
    }
}
