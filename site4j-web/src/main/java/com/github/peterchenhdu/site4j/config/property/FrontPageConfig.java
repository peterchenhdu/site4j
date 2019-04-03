/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.config.property;

import com.github.peterchenhdu.site4j.biz.dto.view.FrontConfigDto;
import com.github.peterchenhdu.site4j.biz.dto.view.FrontModule;
import com.github.peterchenhdu.site4j.common.util.JsonUtils;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

/**
 * @author PiChen
 * @since 2019/3/3
 */
@Component
public class FrontPageConfig implements ResourceLoaderAware {

    private Map<String, FrontModule> frontModuleMap = new HashMap<>();
    private ResourceLoader resourceLoader;

    public void setResourceLoader(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    @PostConstruct
    public void init() {
        try {
            String json = IOUtils.toString(resourceLoader.getResource("classpath:front.page.config.json")
                    .getInputStream(), "utf-8");
            FrontConfigDto frontConfigDto = JsonUtils.json2pojo(json, FrontConfigDto.class);
            frontConfigDto.getModules().forEach(dto -> frontModuleMap.put(dto.getKey(), dto));
            System.out.println("success");
        } catch (Exception e) {
            LogUtils.error(e.toString());
        }

    }

    public Map<String, FrontModule> getFrontModuleMap() {
        return frontModuleMap;
    }

    public void setFrontModuleMap(Map<String, FrontModule> frontModuleMap) {
        this.frontModuleMap = frontModuleMap;
    }

    public FrontModule getFrontModule(String key) {
        return this.frontModuleMap.get(key);
    }
}
