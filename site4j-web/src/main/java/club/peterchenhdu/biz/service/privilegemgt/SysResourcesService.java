/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.privilegemgt;

import club.peterchenhdu.biz.dto.ResourcesDto;
import club.peterchenhdu.biz.dto.front.ZTreeNodeDto;
import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.biz.web.vo.ResourceConditionVO;
import club.peterchenhdu.common.util.PageInfo;
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
}
