/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;


import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleConditionVO;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.baomidou.mybatisplus.service.IService;

/**
 * 角色
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysRoleService extends IService<SysRole> {



    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<SysRole> findPageBreakByCondition(RoleConditionVO vo);

    RoleDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(RoleDto entity);
    boolean removeByPrimaryKey(String primaryKey);
    RoleDto insert(RoleDto entity);
}
