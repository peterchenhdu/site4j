/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;


import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleConditionVO;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

/**
 * 角色
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysRoleService extends IService<SysRole> {



    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<SysRole> findPageBreakByCondition(RoleConditionVO vo);

    RoleDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(RoleDto entity);
    boolean removeByPrimaryKey(String primaryKey);
    RoleDto insert(RoleDto entity);
}
