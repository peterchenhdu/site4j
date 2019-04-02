/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt.impl;

import com.github.peterchenhdu.site4j.biz.entity.SysRoleResources;
import com.github.peterchenhdu.site4j.biz.mapper.SysRoleResourcesMapper;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleResourcesService;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色资源
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class SysRoleResourcesServiceImpl extends ServiceImpl<SysRoleResourcesMapper, SysRoleResources> implements SysRoleResourcesService {
    @Autowired
    private SysRoleResourcesMapper roleResourceMapper;

    /**
     * 添加角色资源
     *
     * @param roleId
     * @param resourcesId
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = {Exception.class})
    public void addRoleResources(String roleId, String resourcesId) {
        //删除
        removeByRoleId(roleId);
        //添加
        if (!StringUtils.isEmpty(resourcesId)) {
            String[] resourcesArr = resourcesId.split(",");
            SysRoleResources r = null;
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
        }
    }

    /**
     * 通过角色id批量删除
     *
     * @param roleId
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = {Exception.class})
    public void removeByRoleId(String roleId) {
        //删除
        Wrapper<SysRoleResources> example = new EntityWrapper<>();
        example.eq("role_id", roleId);
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
