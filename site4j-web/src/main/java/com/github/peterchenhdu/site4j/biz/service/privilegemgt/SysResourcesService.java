/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.privilegemgt;

import com.github.peterchenhdu.site4j.biz.dto.ResourcesDto;
import com.github.peterchenhdu.site4j.biz.dto.view.ZTreeNodeDto;
import com.github.peterchenhdu.site4j.biz.entity.Resource;
import com.github.peterchenhdu.site4j.biz.dto.req.ResourceConditionVO;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

/**
 * 系统资源
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysResourcesService extends IService<Resource> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<ResourcesDto> findPageBreakByCondition(ResourceConditionVO vo);

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
    ResourcesDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(ResourcesDto entity);
    boolean removeByPrimaryKey(String primaryKey);
    ResourcesDto insert(ResourcesDto entity);


    void updateSort(String rId, boolean isUp);
}
