/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizType;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class TypeDto extends BizType{

    private String parentName;


    public TypeDto() {

    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}

