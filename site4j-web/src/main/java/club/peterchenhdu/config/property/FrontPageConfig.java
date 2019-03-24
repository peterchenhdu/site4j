/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.config.property;

import club.peterchenhdu.biz.dto.front.FrontConfigDto;
import club.peterchenhdu.biz.dto.front.FrontModule;
import club.peterchenhdu.common.util.JacksonUtils;
import club.peterchenhdu.common.util.LogUtils;
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
            FrontConfigDto frontConfigDto = JacksonUtils.json2pojo(json, FrontConfigDto.class);
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
