/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;


import com.baomidou.mybatisplus.service.IService;
import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;

import java.util.List;

/**
 * 角色
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysRoleService extends IService<SysRole> {
    PageInfoDto<SysRole> query(RoleQueryDto vo);

    RoleDto queryById(String primaryKey);

    boolean updateSelective(RoleDto entity);

    boolean deleteById(String primaryKey);

    RoleDto save(RoleDto entity);

    List<RoleDto> queryAllAvailableRoleList();
}
