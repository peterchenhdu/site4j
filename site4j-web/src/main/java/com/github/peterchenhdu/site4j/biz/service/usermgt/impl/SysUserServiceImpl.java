/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.usermgt.impl;

import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.UserPwdDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.entity.SysUser;
import com.github.peterchenhdu.site4j.biz.dto.req.UserConditionVO;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.common.util.IpUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.exception.BaseRuntimeException;
import com.github.peterchenhdu.site4j.biz.mapper.SysUserMapper;
import com.github.peterchenhdu.site4j.biz.service.usermgt.SysUserService;
import com.github.peterchenhdu.site4j.util.PasswordUtils;
import com.github.peterchenhdu.site4j.util.RequestHolder;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 用户
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {

    @Autowired
    private SysRoleService sysRoleService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateSelective(UserDto user) {
        Assert.notNull(user, "User不可为空！");
        user.setUpdateTime(LocalDateTime.now());
        user.setPassword(ObjectUtils.isEmpty(user.getPassword()) ? null : PasswordUtils.encrypt(user.getPassword(), user.getUsername()));
        return this.updateById(user);
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return UserDto
     */

    @Override
    public UserDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysUser sysUser = this.selectById(primaryKey);
        return ObjectUtils.isEmpty(sysUser) ? null : new UserDto(sysUser);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity entity
     * @return UserDto
     */
    @Override
    public UserDto getOneByEntity(UserDto entity) {
        Assert.notNull(entity, "User不可为空！");
        SysUser sysUser = this.baseMapper.selectOne(entity);
        return ObjectUtils.isEmpty(sysUser) ? null : new UserDto(sysUser);
    }


    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfo
     */
    @Override
    public PageInfo<UserDto> findPageBreakByCondition(UserConditionVO vo) {
        Page<SysUser> page = PageUtils.getPage(vo);


        Wrapper<SysUser> wrapper = new EntityWrapper<>();
//        wrapper.like("nickname", vo.getKeywords());
        wrapper.orderBy("create_time", false);

        List<SysUser> userList = baseMapper.selectPage(page, wrapper);
        if (ObjectUtils.isEmpty(userList)) {
            return new PageInfo<>(0, Collections.emptyList());
        }


         Map<String, String> roleMap= sysRoleService.selectList(new EntityWrapper<>()).stream()
                 .collect(Collectors.toMap(SysRole::getId, SysRole::getDescription));

        List<UserDto> userDtoList = userList.stream().map(dto->{
            UserDto userDto = new UserDto(dto);
            userDto.setRoleName(roleMap.get(dto.getRoleId()));
            return userDto;
        }).collect(Collectors.toList());

        return new PageInfo<>(page.getTotal(), userDtoList);
    }

    /**
     * 更新用户最后一次登录的状态信息
     *
     * @param user user
     * @return UserDto
     */
    @Override
    public UserDto updateUserLastLoginInfo(UserDto user) {
        if (ObjectUtils.isNotEmpty(user)) {
            user.setLoginCount(user.getLoginCount() + 1);
            user.setLastLoginTime(LocalDateTime.now());
            user.setLastLoginIp(IpUtils.getRealIp(RequestHolder.getRequest()));
            user.setPassword(null);
            this.updateSelective(user);
        }
        return user;
    }

    /**
     * 根据用户名查找
     *
     * @param userName userName
     * @return UserDto
     */
    @Override
    public UserDto getByUserName(String userName) {
        UserDto user = new UserDto(userName, null);
        return getOneByEntity(user);
    }

    /**
     * 通过角色Id获取用户列表
     *
     * @param roleId roleId
     * @return List
     */
    @Override
    public List<UserDto> listByRoleId(String roleId) {
        Wrapper<SysUser> wrapper = new EntityWrapper<>();
        wrapper.eq("role_id", roleId);

        List<SysUser> userList = baseMapper.selectList(wrapper);
        if (CollectionUtils.isEmpty(userList)) {
            return Collections.emptyList();
        }
        return userList.stream().map(UserDto::new).collect(Collectors.toList());
    }

    /**
     * 修改密码
     *
     * @param userPwd userPwd
     * @return boolean
     */
    @Override
    public boolean updatePwd(UserPwdDto userPwd) throws Exception {
        if (!userPwd.getNewPassword().equals(userPwd.getNewPasswordRepeat())) {
            throw new BaseRuntimeException("新密码不一致！");
        }
        UserDto user = this.getByPrimaryKey(userPwd.getId());
        if (null == user) {
            throw new BaseRuntimeException("用户编号错误！请不要手动操作用户ID！");
        }

        if (!user.getPassword().equals(PasswordUtils.encrypt(userPwd.getPassword(), user.getUsername()))) {
            throw new BaseRuntimeException("原密码不正确！");
        }
        user.setPassword(userPwd.getNewPassword());

        return this.updateSelective(user);
    }


}
