/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.usermgt;


import club.peterchenhdu.biz.dto.UserDto;
import club.peterchenhdu.biz.dto.UserPwdDto;
import club.peterchenhdu.biz.entity.SysUser;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.biz.web.vo.UserConditionVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * 用户
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysUserService extends IService<SysUser> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<UserDto> findPageBreakByCondition(UserConditionVO vo);

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
