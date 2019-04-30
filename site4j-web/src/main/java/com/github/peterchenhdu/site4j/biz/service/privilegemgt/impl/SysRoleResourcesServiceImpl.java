/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.peterchenhdu.site4j.biz.entity.SysRoleResources;
import com.github.peterchenhdu.site4j.biz.mapper.SysRoleResourcesMapper;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleResourcesService;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.core.shiro.ShiroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色资源
 * <p>
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class SysRoleResourcesServiceImpl extends ServiceImpl<SysRoleResourcesMapper, SysRoleResources> implements SysRoleResourcesService {
    @Autowired
    private SysRoleResourcesMapper roleResourceMapper;
    @Autowired
    private ShiroService shiroService;

    /**
     * 添加角色资源
     *
     * @param roleId      roleId
     * @param resourcesId resourcesId
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
    public void addRoleResources(String roleId, String resourcesId) {
        //删除
        deleteByRoleId(Collections.singletonList(roleId));

        String[] resourcesArr = resourcesId.split(",");
        SysRoleResources r;
        List<SysRoleResources> roleResources = new ArrayList<>();
        for (String ri : resourcesArr) {
            r = new SysRoleResources();
            r.setId(UuidUtils.getUuid());
            r.setRoleId(roleId);
            r.setResourcesId(ri);
            r.setCreateTime(LocalDateTime.now());
            r.setUpdateTime(LocalDateTime.now());
            roleResources.add(r);

        }
        this.insertBatch(roleResources);

        // 重新加载所有拥有roleId的用户的权限信息
        shiroService.reloadAuthorizingByRoleId(roleId);
    }

    /**
     * 通过角色id批量删除
     *
     * @param roleIdList
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = {Exception.class})
    public void deleteByRoleId(List<String> roleIdList) {
        //删除
        Wrapper<SysRoleResources> example = new EntityWrapper<>();
        example.in("role_id", roleIdList);
        roleResourceMapper.delete(example);
    }

    @Override
    public List<String> queryResourceByRoleId(String roleId) {
        Wrapper<SysRoleResources> wrapper = new EntityWrapper<>();
        wrapper.eq("role_id", roleId);
        return roleResourceMapper.selectList(wrapper).stream()
                .map(SysRoleResources::getResourcesId)
                .collect(Collectors.toList());
    }
}
