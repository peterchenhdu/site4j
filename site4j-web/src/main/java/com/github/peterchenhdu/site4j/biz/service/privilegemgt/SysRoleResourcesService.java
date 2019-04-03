/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;


import com.github.peterchenhdu.site4j.biz.entity.SysRoleResources;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 角色资源
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysRoleResourcesService extends IService<SysRoleResources> {

    /**
     * 添加角色资源
     *
     * @param roleId
     * @param resourcesId
     */
    void addRoleResources(String roleId, String resourcesId);

    /**
     * 通过角色id批量删除
     *
     * @param roleId
     */
    void removeByRoleId(String roleId);

    List<String> queryResourceByRoleId(String roleId);

}