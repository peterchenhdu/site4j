/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.usermgt;


import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.UserPwdDto;
import com.github.peterchenhdu.site4j.biz.entity.SysUser;
import com.github.peterchenhdu.site4j.biz.dto.req.UserConditionVO;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 用户
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<UserDto> findPageBreakByCondition(UserConditionVO vo);

    /**
     * 更新用户最后一次登录的状态信息
     *
     * @param user
     * @return
     */
    UserDto updateUserLastLoginInfo(UserDto user);

    /**
     * 根据用户名查找
     *
     * @param userName
     * @return
     */
    UserDto getByUserName(String userName);

    /**
     * 通过角色Id获取用户列表
     *
     * @param roleId
     * @return
     */
    List<UserDto> listByRoleId(String roleId);

    /**
     * 修改密码
     *
     * @param userPwd
     * @return
     */
    boolean updatePwd(UserPwdDto userPwd) throws Exception;

    UserDto getOneByEntity(UserDto entity);
    UserDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(UserDto entity);


}
