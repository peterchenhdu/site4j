/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.mapper.SysRoleMapper;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleResourcesService;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.biz.service.usermgt.SysUserService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.enums.RoleTypeEnum;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Autowired
    private SysRoleResourcesService roleResourcesService;
    @Autowired
    private SysUserService sysUserService;

    @Override
    public PageInfoDto<SysRole> query(RoleQueryDto vo) {
        Wrapper<SysRole> example = new EntityWrapper<>();
        if (ObjectUtils.isNotEmpty(vo.getType())) {
            example.eq("type", vo.getType());
        }
        if (ObjectUtils.isNotEmpty(vo.getName())) {
            example.like("name", vo.getName());
        }
        if (ObjectUtils.isNotEmpty(vo.getDescription())) {
            example.like("description", vo.getDescription());
        }
        example.orderBy("create_time DESC");
        Page<SysRole> page = PageUtils.getPage(vo);
        List<SysRole> sysRoles = this.baseMapper.selectPage(page, example);
        return PageUtils.getPageInfo(page, sysRoles);
    }


    @Override
    public RoleDto save(RoleDto entity) {
        Assert.notNull(entity, "Role不可为空！");
        entity.setCreateTime(LocalDateTime.now());
        entity.setUpdateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        entity.setAvailable(true);
        this.baseMapper.insert(entity);
        return entity;
    }

    @Override
    public List<RoleDto> queryAllAvailableRoleList() {
        Wrapper<SysRole> example = new EntityWrapper<>();
        example.eq("available", Boolean.TRUE);
        example.orderBy("create_time DESC");
        return this.baseMapper.selectList(example).stream()
                .filter(dto-> !RoleTypeEnum.SUPER_ADMIN.getKey().equals(dto.getType()))
                .map(dto -> BeanConvertUtils.doConvert(dto, RoleDto.class))
                .collect(Collectors.toList());
    }


    @Transactional
    @Override
    public void delete(List<String> roleIdList) {

        List<UserDto> list = sysUserService.listByRoleId(roleIdList);
        if(ObjectUtils.isNotEmpty(list)) {
            throw new CommonRuntimeException("存在关联用户，不能删除");
        }

        this.baseMapper.deleteBatchIds(roleIdList);
        roleResourcesService.deleteByRoleId(roleIdList);
    }


    @Override
    public boolean updateSelective(RoleDto entity) {
        Assert.notNull(entity, "Role不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return this.baseMapper.updateById(entity) > 0;
    }


    @Override
    public RoleDto queryById(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysRole sysRole = this.baseMapper.selectById(primaryKey);
        return null == sysRole ? null : BeanConvertUtils.doConvert(sysRole, RoleDto.class);
    }


}
