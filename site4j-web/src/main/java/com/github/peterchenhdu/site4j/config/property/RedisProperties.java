/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config.property;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

import java.time.Duration;

/**
 * redis属性配置文件
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Configuration
@ConfigurationProperties(prefix = "spring.redis")
@Data
@EqualsAndHashCode(callSuper = false)
@Order(-1)
public class RedisProperties {
    private Integer database;
    private String host;
    private Integer port;
    private String password;
    private Duration timeout;
    /**
     * 默认30天 = 2592000s
     */
    private Integer expire = 2592000;
}
