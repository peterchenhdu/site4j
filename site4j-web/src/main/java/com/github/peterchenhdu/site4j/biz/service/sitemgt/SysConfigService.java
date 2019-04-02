/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;

import java.util.Map;

/**
 * 系统配置
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysConfigService {

    /**
     * 获取系统配置
     *
     * @return
     */
    ConfigDto get();

    /**
     * 添加系统配置
     *
     * @param config
     * @return
     */
    ConfigDto insert(ConfigDto config);

    /**
     * 删除系统配置记录
     *
     * @param id
     */
    void remove(String id);

    /**
     * 修改系统配置记录
     *
     * @param config
     */
    void update(ConfigDto config);

    /**
     * 获取网站详情
     *
     * @return
     */
    Map<String, Object> getSiteInfo();
}
