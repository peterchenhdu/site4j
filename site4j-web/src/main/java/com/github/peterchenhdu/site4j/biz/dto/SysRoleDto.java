/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.SysRole;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class SysRoleDto extends SysRole {
    private Integer selected;

    public Integer getSelected() {
        return selected;
    }

    public void setSelected(Integer selected) {
        this.selected = selected;
    }
}
