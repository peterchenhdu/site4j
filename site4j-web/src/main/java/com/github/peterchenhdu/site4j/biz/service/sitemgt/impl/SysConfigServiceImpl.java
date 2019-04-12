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
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统配置
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class SysConfigServiceImpl implements SysConfigService {

    @Autowired
    private SysConfigMapper sysConfigMapper;

    @Autowired
    private DictService dictService;

    /**
     * 获取系统配置详情
     *
     * @return ConfigDto
     */
    @Override
    @RedisCache
    public ConfigDto get() {
        List<SysConfig> configList = sysConfigMapper.selectList(new EntityWrapper<>());
        return ObjectUtils.isEmpty(configList) ? null : BeanConvertUtils.doConvert(configList.get(0), ConfigDto.class);
    }




    /**
     * 修改系统配置记录
     *
     * @param config config
     */
    @Override
    @RedisCache(flush = true)
    public void update(ConfigDto config) {
        sysConfigMapper.updateById(config);
    }

    /**
     * 获取网站统计数据
     *
     * @return Map
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
