/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.privilegemgt.impl;

import club.peterchenhdu.biz.dto.ResourcesDto;
import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.biz.mapper.ResourceMapper;
import club.peterchenhdu.biz.service.privilegemgt.SysResourcesService;
import club.peterchenhdu.biz.web.vo.ResourceConditionVO;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.PageUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 系统资源
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class SysResourcesServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements SysResourcesService {

    @Autowired
    private ResourceMapper resourceMapper;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfo<ResourcesDto> findPageBreakByCondition(ResourceConditionVO vo) {
        Page<ResourcesDto> page = PageUtils.getPage(vo);
        List<ResourcesDto> resourcesDtoList = resourceMapper.findPageBreakByCondition(page, vo);
        return new PageInfo<>(page.getTotal(), resourcesDtoList);
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
    public List<Map<String, Object>> queryResourceTree(String rid) {
        List<Resource> resourceList = resourceMapper.selectList(new EntityWrapper<>());
        List<Map<String, Object>> mapList = new ArrayList<>();
        resourceList.forEach(r -> {
            Map<String, Object> map = new HashMap<>(3);
            map.put("id", r.getId());
            map.put("pId", r.getParentId());
            map.put("checked", "false");
            map.put("name", r.getName());
            mapList.add(map);
        });
        return mapList;
    }

    /**
     * 获取资源的url和permission
     *
     * @return
     */
    @Override
    public List<ResourcesDto> listUrlAndPermission() {
        List<Resource> sysResources = resourceMapper.selectList(new EntityWrapper<>());;
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

        Resource entity = new Resource();
        BeanUtils.copyProperties(dto, entity);

        resourceMapper.insert(entity);
        return new ResourcesDto(entity);
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
        Resource entity = new Resource();
        BeanUtils.copyProperties(dto, entity);
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
