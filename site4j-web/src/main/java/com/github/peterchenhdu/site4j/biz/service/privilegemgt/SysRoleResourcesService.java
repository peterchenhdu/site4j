/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;


import com.github.peterchenhdu.site4j.biz.entity.SysRoleResources;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 角色资源
 * <p>
 * Created by chenpi on 2019/02/05.
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
