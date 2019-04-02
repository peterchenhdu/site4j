/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.dto.view;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/3/3
 */
public class FrontConfigDto {
    private String name;
    private List<FrontModule> modules;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<FrontModule> getModules() {
        return modules;
    }

    public void setModules(List<FrontModule> modules) {
        this.modules = modules;
    }
}
