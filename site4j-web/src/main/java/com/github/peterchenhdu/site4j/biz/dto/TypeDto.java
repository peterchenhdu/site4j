/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizType;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class TypeDto extends BizType{

    private String parentName;
    /**
     * 包含自己及子节点id， 逗号分隔
     */
    private String subIds;
    private List<TypeDto> nodes = new ArrayList<>();

    public TypeDto() {

    }

    public List<TypeDto> getNodes() {
        return nodes;
    }

    public void setNodes(List<TypeDto> nodes) {
        this.nodes = nodes;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public String getSubIds() {
        return subIds;
    }

    public void setSubIds(String subIds) {
        this.subIds = subIds;
    }
}

