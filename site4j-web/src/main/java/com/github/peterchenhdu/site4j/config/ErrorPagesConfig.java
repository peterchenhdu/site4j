/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

/**
 * 自定义的异常页面配置
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Component
public class ErrorPagesConfig {
    /**
     * 自定义异常处理路径
     *
     * @return
     */
    @Bean
    public WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> containerCustomizer() {
        return factory -> {
            factory.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST, "/error/400"));
            factory.addErrorPages(new ErrorPage(HttpStatus.UNAUTHORIZED, "/error/401"));
            factory.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/error/403"));
            factory.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error/404"));
            factory.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/500"));
            factory.addErrorPages(new ErrorPage(Throwable.class, "/error/500"));
        };
    }
}
