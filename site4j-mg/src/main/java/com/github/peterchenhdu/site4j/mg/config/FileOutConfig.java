/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config;

import com.github.peterchenhdu.site4j.mg.config.po.TableInfo;

/**
 * <p>
 * 输出文件配置
 * </p>
 *
 * @author hubin
 * @since 2017-01-18
 */
public abstract class FileOutConfig {

    /**
     * 模板
     */
    private String templatePath;

    public FileOutConfig() {
        // to do nothing
    }

    public FileOutConfig(String templatePath) {
        this.templatePath = templatePath;
    }

    /**
     * 输出文件
     */
    public abstract String outputFile(TableInfo tableInfo);

    public String getTemplatePath() {
        return templatePath;
    }

    public FileOutConfig setTemplatePath(String templatePath) {
        this.templatePath = templatePath;
        return this;
    }

}
