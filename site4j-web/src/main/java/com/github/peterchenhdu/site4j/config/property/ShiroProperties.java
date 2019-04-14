/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config.property;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Configuration
@ConfigurationProperties(prefix = "app.shiro")
@Data
@EqualsAndHashCode(callSuper = false)
@Order(-1)
public class ShiroProperties {

    public String loginUrl = "/admin/passport/login/";
    public String successUrl = "/";
    public String unauthorizedUrl = "/error/403";


}
