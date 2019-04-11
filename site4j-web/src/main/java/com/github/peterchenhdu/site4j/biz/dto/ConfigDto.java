/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysConfig;
import org.springframework.beans.BeanUtils;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ConfigDto extends SysConfig{

    public ConfigDto( SysConfig config) {
        super();
        BeanUtils.copyProperties(config, this);
    }

    public ConfigDto( ) {
        super();
    }

}

