/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt.impl;

import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ResourceConditionVO;
import com.github.peterchenhdu.site4j.biz.dto.view.ZTreeNodeDto;
import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.biz.mapper.ResourceMapper;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysResourcesService;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleResourcesService;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 系统资源
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Service
public class SysResourcesServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements SysResourcesService {

    @Autowired
    private ResourceMapper resourceMapper;
    @Autowired
    private SysRoleResourcesService sysRoleResourcesService;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfoDto<ResourcesDto> findPageBreakByCondition(ResourceConditionVO vo) {
        Page<ResourcesDto> page = PageUtils.getPage(vo);
        List<ResourcesDto> resourcesDtoList = resourceMapper.findPageBreakByCondition(page, vo);
        return new PageInfoDto<>(page.getTotal(), resourcesDtoList);
    }

    /**
     * 获取用户的资源列表
     *
     * @param map
     * @return
     */
    @Override
    public List<ResourcesDto> listUserResources(Map<String, Object> map) {
        List<ResourcesDto> sysResources = resourceMapper.listUserResources(map);
        if (CollectionUtils.isEmpty(sysResources)) {
            return Collections.emptyList();
        }
        return sysResources;
    }

    /**
     * 获取ztree使用的资源列表
     *
     * @param rid
     * @return
     */
    @Override
    public List<ZTreeNodeDto> queryResourceTree(String rid) {
        //查询所有资源
        List<Resource> allResourceList = resourceMapper.selectList(new EntityWrapper<>());
        //查询角色关联的所有资源ID
        List<String> resourceIdList = sysRoleResourcesService.queryResourceByRoleId(rid);


        List<ZTreeNodeDto> mapList = new ArrayList<>();
        allResourceList.forEach(r -> {
            ZTreeNodeDto zTreeNodeDto = new ZTreeNodeDto();
            zTreeNodeDto.setId(r.getId());
            zTreeNodeDto.setChecked(resourceIdList.contains(r.getId()));
            zTreeNodeDto.setName(r.getName());
            zTreeNodeDto.setpId(r.getParentId());
            mapList.add(zTreeNodeDto);
        });
        return mapList;
    }

    @Override
    public List<ResourcesDto> querySameLevelResource(String rid) {
        Resource resource = resourceMapper.selectById(rid);
        String pId = resource.getParentId();
        Wrapper<Resource> wrapper = new EntityWrapper<>();
        if(pId == null) {
            wrapper.isNull("parent_id");
        } else {
            wrapper.eq("parent_id", pId);
        }

        wrapper.orderBy("sort");

        return resourceMapper.selectList(wrapper).stream()
                .map(ResourcesDto::new)
                .collect(Collectors.toList());
    }

    /**
     * 查询所有非叶子节点
     *
     * @return List
     */
    @Override
    public List<ResourcesDto> queryNotLeafResource() {
        List<ResourcesDto> allResourcesDtoList = listAll();
        List<String> parentIdList = allResourcesDtoList.stream().map(ResourcesDto::getParentId).collect(Collectors.toList());

        List<ResourcesDto> test =allResourcesDtoList.stream().filter(dto-> parentIdList.contains(dto.getId())).collect(Collectors.toList());
        return test;
    }

    /**
     * 获取资源的url和permission
     *
     * @return
     */
    @Override
    public List<ResourcesDto> listUrlAndPermission() {
        List<Resource> sysResources = resourceMapper.selectList(new EntityWrapper<>());
        ;
        return sysResources.stream().map(ResourcesDto::new).collect(Collectors.toList());
    }


    /**
     * 获取用户关联的所有资源
     *
     * @param userId
     * @return
     */
    @Override
    public List<ResourcesDto> listByUserId(String userId) {

        return resourceMapper.listByUserId(userId);
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param dto
     * @return
     */
    @Override
    public ResourcesDto insert(ResourcesDto dto) {
        Assert.notNull(dto, "Resources不可为空！");
        Resource entity = BeanConvertUtils.doConvert(dto, Resource.class);
        resourceMapper.insert(entity);
        return new ResourcesDto(entity);
    }


    //todo 考虑下并发操作 有问题 待修复
    @Override
    @Transactional
    public void updateSort(String rId, boolean isUp) {
        Resource resource = resourceMapper.selectById(rId);
        Integer sort = resource.getSort();
        String pId = resource.getParentId();
        Wrapper<Resource> wrapper = new EntityWrapper<>();
        wrapper.eq("parent_id", pId);
        wrapper.in("sort", new Integer[]{resource.getSort() - 1, resource.getSort(), resource.getSort() + 1});
        wrapper.orderBy("sort");
        List<Resource> rList= resourceMapper.selectList(wrapper);

        Resource otherResource;
        if(isUp) {
            otherResource = rList.size() == 2 ? rList.get(1):rList.get(0);
            resource.setSort(resource.getSort() - 1);
            otherResource.setSort(sort);


        } else {
            otherResource = rList.size() == 2 ? rList.get(1):rList.get(2);
            resource.setSort(resource.getSort() + 1);
            otherResource.setSort(sort);
        }

        resourceMapper.updateById(otherResource);
        resourceMapper.updateById(resource);
    }


    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    @Override
    public boolean removeByPrimaryKey(String primaryKey) {
        return resourceMapper.deleteById(primaryKey) > 0;
    }


    /**
     * 根据主键更新属性不为null的值
     *
     * @param dto
     * @return
     */
    @Override
    public boolean updateSelective(ResourcesDto dto) {
        Assert.notNull(dto, "Resources不可为空！");
        Resource entity = BeanConvertUtils.doConvert(dto, Resource.class);
        return resourceMapper.updateById(entity) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public ResourcesDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        Resource sysResources = resourceMapper.selectById(primaryKey);
        return null == sysResources ? null : new ResourcesDto(sysResources);
    }


    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    @Override
    public List<ResourcesDto> listAll() {
        List<Resource> sysResources = resourceMapper.selectList(new EntityWrapper<>());
        return sysResources.stream().map(ResourcesDto::new).collect(Collectors.toList());
    }


}
