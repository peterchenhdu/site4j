/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;

import java.util.Map;

/**
 * 系统配置
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysConfigService {

    /**
     * 获取系统配置详情
     *
     * @return ConfigDto
     */
    ConfigDto get();

    /**
     * 修改系统配置记录
     *
     * @param config config
     */
    void update(ConfigDto config);

    /**
     * 获取网站统计数据
     *
     * @return Map
     */
    Map<String, Object> getSiteInfo();
}
