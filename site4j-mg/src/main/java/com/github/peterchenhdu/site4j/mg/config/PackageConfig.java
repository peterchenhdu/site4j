/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config;

import com.baomidou.mybatisplus.toolkit.StringUtils;

/**
 * <p>
 * 跟包相关的配置项
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class PackageConfig {

    /**
     * 父包名。如果为空，将下面子包名必须写全部， 否则就只需写子包名
     */
    private String parent = "com.baomidou";

    /**
     * 父包模块名。
     */
    private String moduleName = null;

    /**
     * Entity包名
     */
    private String entity = "entity";

    /**
     * Service包名
     */
    private String service = "service";

    /**
     * Service Impl包名
     */
    private String serviceImpl = "service.impl";
    /**
     * Mapper包名
     */
    private String mapper = "mapper";

    /**
     * Mapper XML包名
     */
    private String xml = "mapper.xml";

    /**
     * Controller包名
     */
    private String controller = "web";

    public String getParent() {
        if (StringUtils.isNotEmpty(moduleName)) {
            return parent + "." + moduleName;
        }
        return parent;
    }

    public PackageConfig setParent(String parent) {
        this.parent = parent;
        return this;
    }

    public String getModuleName() {
        return moduleName;
    }

    public PackageConfig setModuleName(String moduleName) {
        this.moduleName = moduleName;
        return this;
    }

    public String getEntity() {
        return entity;
    }

    public PackageConfig setEntity(String entity) {
        this.entity = entity;
        return this;
    }

    public String getService() {
        return service;
    }

    public PackageConfig setService(String service) {
        this.service = service;
        return this;
    }

    public String getServiceImpl() {
        return serviceImpl;
    }

    public PackageConfig setServiceImpl(String serviceImpl) {
        this.serviceImpl = serviceImpl;
        return this;
    }

    public String getMapper() {
        return mapper;
    }

    public PackageConfig setMapper(String mapper) {
        this.mapper = mapper;
        return this;
    }

    public String getXml() {
        return xml;
    }

    public PackageConfig setXml(String xml) {
        this.xml = xml;
        return this;
    }

    public String getController() {
        if (StringUtils.isEmpty(controller)) {
            return "web";
        }
        return controller;
    }

    public PackageConfig setController(String controller) {
        this.controller = controller;
        return this;
    }

}
