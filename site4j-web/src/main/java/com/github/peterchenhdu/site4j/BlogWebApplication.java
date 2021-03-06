/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 程序启动类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@ServletComponentScan
@SpringBootApplication(scanBasePackages = {"com.github.peterchenhdu.site4j"})
@EnableTransactionManagement
public class BlogWebApplication {
    public static final String ROOT_PACKAGE_PATH = BlogWebApplication.class.getPackage().getName();

    public static void main(String[] args) {
        System.out.println(ROOT_PACKAGE_PATH);
        SpringApplication.run(BlogWebApplication.class, args);
    }

}
