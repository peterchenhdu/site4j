/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.service.usermgt.impl;

import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.UserPwdDto;
import com.github.peterchenhdu.site4j.biz.dto.req.UserQueryDto;
import com.github.peterchenhdu.site4j.biz.mapper.SysUserMapper;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.web.IpUtils;
import com.github.peterchenhdu.site4j.util.PasswordUtils;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import java.util.Arrays;
import java.util.List;

import static org.mockito.Mockito.when;

/**
 * Created by PiChen on 2019/5/24.
 */
@RunWith(PowerMockRunner.class)
@PrepareForTest({IpUtils.class, PasswordUtils.class})
public class SysUserServiceImplTest {
    @Mock
    private SysRoleService sysRoleService;
    @Mock
    private SysUserMapper baseMapper;
    @InjectMocks
    private SysUserServiceImpl sysUserServiceImpl;

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testUpdateSelective() throws Exception {
        boolean result = sysUserServiceImpl.updateSelective(new UserDto("loginName", "password"));
        Assert.assertEquals(true, result);
    }

    @Test
    public void testQueryById() throws Exception {
        UserDto result = sysUserServiceImpl.queryById("primaryKey");
        Assert.assertEquals(new UserDto("loginName", "password"), result);
    }

    @Test
    public void testGetOneByEntity() throws Exception {
        UserDto result = sysUserServiceImpl.getOneByEntity(new UserDto("loginName", "password"));
        Assert.assertEquals(new UserDto("loginName", "password"), result);
    }

    @Test
    public void testQuery() throws Exception {
        PageInfoDto<UserDto> result = sysUserServiceImpl.query(new UserQueryDto());
        Assert.assertNotNull(result);
    }

    @Test
    public void testUpdateUserLastLoginInfo() throws Exception {
        PowerMockito.mockStatic(IpUtils.class);
        PowerMockito.mockStatic(PasswordUtils.class);

        when(IpUtils.getRealIp(Mockito.any())).thenReturn("123");
        PowerMockito.when(PasswordUtils.encrypt(Mockito.any(), Mockito.any())).thenReturn("1234");
        PowerMockito.when(baseMapper.updateById(Mockito.any())).thenReturn(1);


        UserDto userDto = new UserDto("loginName", "password");
        userDto.setLoginCount(1);
        UserDto result = sysUserServiceImpl.updateUserLastLoginInfo(userDto);
        Assert.assertNotNull(result);
    }

    @Test
    public void testGetByUserName() throws Exception {
        UserDto result = sysUserServiceImpl.getByUserName("userName");
        Assert.assertEquals(new UserDto("loginName", "password"), result);
    }

    @Test
    public void testListByRoleId() throws Exception {
        List<UserDto> result = sysUserServiceImpl.listByRoleId(Arrays.<String>asList("String"));
        Assert.assertEquals(Arrays.<UserDto>asList(new UserDto("loginName", "password")), result);
    }

    @Test
    public void testUpdatePwd() throws Exception {
        boolean result = sysUserServiceImpl.updatePwd(new UserPwdDto());
        Assert.assertEquals(true, result);
    }
}

//Generated with love by TestMe :) Please report issues and submit feature requests at: http://weirddev.com/forum#!/testme