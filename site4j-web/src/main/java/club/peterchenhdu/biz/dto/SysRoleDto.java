/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.SysRole;

/**
 * @author PiChen
 * @since 2019/3/14
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
