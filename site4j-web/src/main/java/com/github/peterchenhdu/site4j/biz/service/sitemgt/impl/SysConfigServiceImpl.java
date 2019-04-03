/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt.impl;

import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.entity.Dict;
import com.github.peterchenhdu.site4j.biz.entity.SysConfig;
import com.github.peterchenhdu.site4j.enums.DictTypeEnum;
import com.github.peterchenhdu.site4j.biz.mapper.SysConfigMapper;
import com.github.peterchenhdu.site4j.biz.service.common.DictService;
import com.github.peterchenhdu.site4j.common.util.DateTimeUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
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
@Service
public class SysConfigServiceImpl implements SysConfigService {

    @Autowired
    private SysConfigMapper sysConfigMapper;

    @Autowired
    private DictService dictService;

    /**
     * 获取系统配置
     *
     * @return
     */
    @Override
//    @RedisCache
    public ConfigDto get() {
        List<SysConfig> configList = sysConfigMapper.selectList(new EntityWrapper<>());
        return ObjectUtils.isEmpty(configList) ? null : new ConfigDto(configList.get(0));
    }

    /**
     * 添加系统配置
     *
     * @param config
     * @return
     */
    @Override
    @RedisCache(flush = true)
    public ConfigDto insert(ConfigDto config) {
        config.setCreateTime(LocalDateTime.now());
        config.setUpdateTime(LocalDateTime.now());
        sysConfigMapper.insert(config.getSysConfig());
        return config;
    }

    /**
     * 删除系统配置记录
     *
     * @param id
     */
    @Override
    @RedisCache(flush = true)
    public void remove(String id) {
        sysConfigMapper.deleteById(id);
    }

    /**
     * 修改系统配置记录
     *
     * @param config
     */
    @Override
    @RedisCache(flush = true)
    public void update(ConfigDto config) {
        config.setUpdateTime(LocalDateTime.now());
        sysConfigMapper.updateById(config.getSysConfig());
    }

    /**
     * 获取网站详情
     *
     * @return
     */
    @Override
    public Map<String, Object> getSiteInfo() {

        Map<String, Object> map = new HashMap<>();
        List<Dict> dictList = dictService.queryByType(DictTypeEnum.SYS_STAT.getType());
        dictList.forEach(dto-> map.put(dto.getDictKey(), dto.getDictValue()));


        ConfigDto sysConfig = get();
        map.put("buildSiteDate", DateTimeUtils.getGapDay(sysConfig.getCreateTime(), LocalDateTime.now()));
        return map;
    }
}
