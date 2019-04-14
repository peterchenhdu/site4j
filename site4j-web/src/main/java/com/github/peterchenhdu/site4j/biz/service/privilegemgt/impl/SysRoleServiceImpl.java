/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.dto.RoleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.RoleConditionVO;
import com.github.peterchenhdu.site4j.biz.entity.SysRole;
import com.github.peterchenhdu.site4j.biz.mapper.SysRoleMapper;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 角色
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper,SysRole> implements SysRoleService {

    @Autowired
    private SysRoleMapper roleMapper;




    @Override
    public PageInfoDto<SysRole> findPageBreakByCondition(RoleConditionVO vo) {
        Wrapper<SysRole> example = new EntityWrapper<>();
//        if(ObjectUtils.isNotEmpty(vo.getKeywords())) {
//            example.like("description", vo.getKeywords());
//        }
        example.orderBy("create_time DESC");

        Page<SysRole> page = PageUtils.getPage(vo);
        List<SysRole> sysRoles = roleMapper.selectPage(page, example);
        return PageUtils.getPageInfo(page, sysRoles);
    }



    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    public RoleDto insert(RoleDto entity) {
        Assert.notNull(entity, "Role不可为空！");
        entity.setCreateTime(LocalDateTime.now());
        entity.setUpdateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        entity.setAvailable(true);
        roleMapper.insert(entity.getSysRole());
        return entity;
    }



    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    @Override
    public boolean removeByPrimaryKey(String primaryKey) {
        return roleMapper.deleteById(primaryKey) > 0;
    }



    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    public boolean updateSelective(RoleDto entity) {
        Assert.notNull(entity, "Role不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return roleMapper.updateById(entity.getSysRole()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public RoleDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysRole sysRole = roleMapper.selectById(primaryKey);
        return null == sysRole ? null : new RoleDto(sysRole);
    }




    private List<RoleDto> getRole(List<SysRole> sysRole) {
        if (CollectionUtils.isEmpty(sysRole)) {
            return null;
        }
        List<RoleDto> role = new ArrayList<>();
        for (SysRole r : sysRole) {
            role.add(new RoleDto(r));
        }
        return role;
    }
}
