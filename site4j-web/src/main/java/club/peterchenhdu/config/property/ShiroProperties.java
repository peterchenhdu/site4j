/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.config.property;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/8/27 15:26
 * @since 1.0
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
