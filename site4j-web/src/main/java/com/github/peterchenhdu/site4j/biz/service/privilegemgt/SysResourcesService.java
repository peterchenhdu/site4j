/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;

import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.dto.view.ZTreeNodeDto;
import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.biz.dto.req.ResourceQueryDto;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 系统资源
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysResourcesService extends IService<Resource> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<ResourcesDto> query(ResourceQueryDto vo);

    /**
     * 获取用户的资源列表
     *
     * @param map
     * @return
     */
    List<ResourcesDto> listUserResources(Map<String, Object> map);

    /**
     * 获取ztree使用的资源列表
     *
     * @param rid
     * @return
     */
    List<ZTreeNodeDto> queryResourceTree(String rid);

    List<ResourcesDto> querySameLevelResource(String rid);

    /**
     * 查询所有非叶子节点
     * @return List
     */
    List<ResourcesDto> queryNotLeafResource();

    /**
     * 获取资源的url和permission
     *
     * @return
     */
    List<ResourcesDto> listUrlAndPermission();



    /**
     * 获取用户关联的所有资源
     *
     * @param userId
     * @return
     */
    List<ResourcesDto> listByUserId(String userId);

    List<ResourcesDto> listAll();
    ResourcesDto queryById(String primaryKey);
    boolean updateSelective(ResourcesDto entity);
    boolean deleteById(String primaryKey);
    ResourcesDto save(ResourcesDto entity);


    void updateSort(String rId, boolean isUp);
}
