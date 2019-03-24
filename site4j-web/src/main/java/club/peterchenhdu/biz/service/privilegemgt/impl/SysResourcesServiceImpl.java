/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.privilegemgt.impl;

import club.peterchenhdu.biz.dto.ResourcesDto;
import club.peterchenhdu.biz.dto.SysResourceDto;
import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.biz.mapper.ResourceMapper;
import club.peterchenhdu.biz.service.privilegemgt.SysResourcesService;
import club.peterchenhdu.biz.web.vo.ResourceConditionVO;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.PageUtils;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.*;

/**
 * 系统资源
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Service
public class SysResourcesServiceImpl extends ServiceImpl<ResourceMapper,Resource> implements SysResourcesService {

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

        Page<SysResourceDto> page = PageUtils.getPage(vo);
        List<SysResourceDto> sysResources = resourceMapper.findPageBreakByCondition(page, vo);
        if (CollectionUtils.isEmpty(sysResources)) {
            return null;
        }
        List<ResourcesDto> resources = new ArrayList<>();
        for (Resource r : sysResources) {
            resources.add(new ResourcesDto(r));
        }

        return new PageInfo<>(page.getTotal(), resources);
    }

    /**
     * 获取用户的资源列表
     *
     * @param map
     * @return
     */
    @Override
    public List<SysResourceDto> listUserResources(Map<String, Object> map) {
        List<SysResourceDto> sysResources = resourceMapper.listUserResources(map);
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
    public List<Map<String, Object>> queryResourcesListWithSelected(String rid) {
        List<SysResourceDto> sysResources = resourceMapper.queryResourcesListWithSelected(rid);
        if (CollectionUtils.isEmpty(sysResources)) {
            return null;
        }
        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = null;
        for (SysResourceDto resources : sysResources) {
            map = new HashMap<String, Object>(3);
            map.put("id", resources.getId());
            map.put("pId", resources.getParentId());
            map.put("checked", resources.getChecked());
            map.put("name", resources.getName());
            mapList.add(map);
        }
        return mapList;
    }

    /**
     * 获取资源的url和permission
     *
     * @return
     */
    @Override
    public List<ResourcesDto> listUrlAndPermission() {
        List<SysResourceDto> sysResources = resourceMapper.listUrlAndPermission();
        return getResources(sysResources);
    }

    /**
     * 获取所有可用的菜单资源
     *
     * @return
     */
    @Override
    public List<ResourcesDto> listAllAvailableMenu() {
        List<SysResourceDto> sysResources = resourceMapper.listAllAvailableMenu();
        return getResources(sysResources);
    }

    /**
     * 获取用户关联的所有资源
     *
     * @param userId
     * @return
     */
    @Override
    public List<ResourcesDto> listByUserId(String userId) {
        List<SysResourceDto> sysResources = resourceMapper.listByUserId(userId);
        return getResources(sysResources);
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    public ResourcesDto insert(ResourcesDto entity) {
        Assert.notNull(entity, "Resources不可为空！");
//        entity.setCreateTime(LocalDateTime.now());
//        entity.setUpdateTime(LocalDateTime.now());
//        entity.setId(UuidUtils.getUuid());

//
//        if(ResourceTypeEnum.MENU.getKey().equals(entity.getType())) {
//            entity.setName(ModuleEnum.getByKey(entity.getModule()).getDescription() + "管理");
//            entity.setUrl("/admin/"+entity.getModule());
//            entity.setPermission(entity.getModule());
//        } else {
//            StringBuilder name = new StringBuilder();
//            if(ObjectUtils.isNotEmpty(entity.getOperation())) {
//                name.append(OperationEnum.getByKey(entity.getOperation()).getDescription());
//            }
//            name.append(ModuleEnum.getByKey(entity.getModule()).getDescription());
//            entity.setName(name.toString());
//
//            StringBuilder url = new StringBuilder();
//            url.append("/admin/").append(entity.getModule());
//            if(ObjectUtils.isNotEmpty(entity.getOperation())) {
//                url.append("/").append(entity.getOperation());
//            }
//            entity.setUrl(url.toString());
//
//            StringBuilder permission = new StringBuilder();
//            permission.append(entity.getModule());
//            if(ObjectUtils.isNotEmpty(entity.getOperation())) {
//                permission.append(":").append(entity.getOperation());
//            }
//            entity.setPermission(permission.toString());
//        }



        resourceMapper.insert(entity);
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
        return resourceMapper.deleteById(primaryKey) > 0;
    }



    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    public boolean updateSelective(ResourcesDto entity) {
        Assert.notNull(entity, "Resources不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
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
        List<SysResourceDto> sysResources = resourceMapper.listAll();
        return getResources(sysResources);
    }



    private List<ResourcesDto> getResources(List<SysResourceDto> sysResources) {
        if (CollectionUtils.isEmpty(sysResources)) {
            return Collections.emptyList();
        }
        List<ResourcesDto> resources = new ArrayList<>();
        for (Resource r : sysResources) {
            resources.add(new ResourcesDto(r));
        }
        return resources;
    }
}
