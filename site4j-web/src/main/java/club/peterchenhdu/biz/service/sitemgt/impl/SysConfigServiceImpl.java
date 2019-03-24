/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt.impl;

import club.peterchenhdu.common.annotation.RedisCache;
import club.peterchenhdu.biz.dto.ConfigDto;
import club.peterchenhdu.biz.entity.Dict;
import club.peterchenhdu.biz.entity.SysConfig;
import club.peterchenhdu.common.enums.DictTypeEnum;
import club.peterchenhdu.biz.mapper.SysConfigMapper;
import club.peterchenhdu.biz.service.common.DictService;
import club.peterchenhdu.biz.service.sitemgt.SysConfigService;
import club.peterchenhdu.common.util.DateUtils;
import club.peterchenhdu.common.util.ObjectUtils;
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
        map.put("buildSiteDate", DateUtils.getGapDay(sysConfig.getCreateTime(), LocalDateTime.now()));
        return map;
    }
}
