/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.dto;


import club.peterchenhdu.biz.entity.Resource;

import java.util.List;

/**
 * @author PiChen
 * @since 2019/3/10
 */
public class SysResourceDto extends Resource {

    private String checked;
    private Resource parent;
    private List<Resource> nodes;

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public Resource getParent() {
        return parent;
    }

    public void setParent(Resource parent) {
        this.parent = parent;
    }

    public List<Resource> getNodes() {
        return nodes;
    }

    public void setNodes(List<Resource> nodes) {
        this.nodes = nodes;
    }
}
