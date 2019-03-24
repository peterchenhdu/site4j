/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.config.property;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Component
@ConfigurationProperties(prefix = "app")
@Data
public class AppProperties {

    public Boolean enableVCode;

    public boolean getEnableVCode() {
        return null == enableVCode ? false : enableVCode;
    }

}
