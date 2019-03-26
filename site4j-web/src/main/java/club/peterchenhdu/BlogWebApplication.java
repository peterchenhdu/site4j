/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 程序启动类
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
 */
@ServletComponentScan
@SpringBootApplication(scanBasePackages = {"club.peterchenhdu"})
@EnableTransactionManagement
public class BlogWebApplication {
    public static final String ROOT_PACKAGE_PATH = BlogWebApplication.class.getPackage().getName();

    public static void main(String[] args) {
        System.out.println(ROOT_PACKAGE_PATH);
        SpringApplication.run(BlogWebApplication.class, args);
    }

}
