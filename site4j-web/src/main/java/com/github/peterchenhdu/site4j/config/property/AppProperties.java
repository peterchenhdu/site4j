/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config.property;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
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
