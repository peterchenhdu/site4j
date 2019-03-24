/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.privilegemgt;


import club.peterchenhdu.biz.dto.RoleDto;
import club.peterchenhdu.biz.entity.SysRole;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.biz.web.vo.RoleConditionVO;
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
