/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config;

import com.baomidou.mybatisplus.enums.IdType;

/**
 * <p>
 * 全局配置
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class GlobalConfig {

    /**
     * 生成文件的输出目录【默认 D 盘根目录】
     */
    private String outputDir = "D://";

    /**
     * 是否覆盖已有文件
     */
    private boolean fileOverride = false;

    /**
     * 是否打开输出目录
     */
    private boolean open = true;

    /**
     * 是否在xml中添加二级缓存配置
     */
    private boolean enableCache = true;

    /**
     * 开发人员
     */
    private String author;

    /**
     * 开启 Kotlin 模式
     */
    private boolean kotlin = false;

    /**
     * 开启 ActiveRecord 模式
     */
    private boolean activeRecord = true;

    /**
     * 开启 BaseResultMap
     */
    private boolean baseResultMap = false;

    /**
     * 开启 baseColumnList
     */
    private boolean baseColumnList = false;
    /**
     * 各层文件名称方式，例如： %Action 生成 UserAction
     */
    private String mapperName;
    private String xmlName;
    private String serviceName;
    private String serviceImplName;
    private String controllerName;
    /**
     * 指定生成的主键的ID类型
     */
    private IdType idType;

    public GlobalConfig setIdType(IdType idType) {
        this.idType = idType;
        return this;
    }

    public IdType getIdType() {
        return idType;
    }

    public String getOutputDir() {
        return outputDir;
    }

    public GlobalConfig setOutputDir(String outputDir) {
        this.outputDir = outputDir;
        return this;
    }

    public boolean isFileOverride() {
        return fileOverride;
    }

    public GlobalConfig setFileOverride(boolean fileOverride) {
        this.fileOverride = fileOverride;
        return this;
    }

    public boolean isOpen() {
        return open;
    }

    public GlobalConfig setOpen(boolean open) {
        this.open = open;
        return this;
    }

    public boolean isEnableCache() {
        return enableCache;
    }

    public GlobalConfig setEnableCache(boolean enableCache) {
        this.enableCache = enableCache;
        return this;
    }

    public String getAuthor() {
        return author;
    }

    public GlobalConfig setAuthor(String author) {
        this.author = author;
        return this;
    }

    public boolean isKotlin() {
        return kotlin;
    }

    public GlobalConfig setKotlin(boolean kotlin) {
        this.kotlin = kotlin;
        return this;
    }

    public boolean isActiveRecord() {
        return activeRecord;
    }

    public GlobalConfig setActiveRecord(boolean activeRecord) {
        this.activeRecord = activeRecord;
        return this;
    }

    public boolean isBaseResultMap() {
        return baseResultMap;
    }

    public GlobalConfig setBaseResultMap(boolean baseResultMap) {
        this.baseResultMap = baseResultMap;
        return this;
    }

    public boolean isBaseColumnList() {
        return baseColumnList;
    }

    public GlobalConfig setBaseColumnList(boolean baseColumnList) {
        this.baseColumnList = baseColumnList;
        return this;
    }

    public String getMapperName() {
        return mapperName;
    }

    public GlobalConfig setMapperName(String mapperName) {
        this.mapperName = mapperName;
        return this;
    }

    public String getXmlName() {
        return xmlName;
    }

    public GlobalConfig setXmlName(String xmlName) {
        this.xmlName = xmlName;
        return this;
    }

    public String getServiceName() {
        return serviceName;
    }

    public GlobalConfig setServiceName(String serviceName) {
        this.serviceName = serviceName;
        return this;
    }

    public String getServiceImplName() {
        return serviceImplName;
    }

    public GlobalConfig setServiceImplName(String serviceImplName) {
        this.serviceImplName = serviceImplName;
        return this;
    }

    public String getControllerName() {
        return controllerName;
    }

    public GlobalConfig setControllerName(String controllerName) {
        this.controllerName = controllerName;
        return this;
    }
}
