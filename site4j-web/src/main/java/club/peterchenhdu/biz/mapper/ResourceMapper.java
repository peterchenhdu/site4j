/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.mapper;

import club.peterchenhdu.biz.dto.SysResourceDto;
import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.biz.web.vo.ResourceConditionVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Repository
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<SysResourceDto> findPageBreakByCondition(Page<SysResourceDto> page, ResourceConditionVO vo);

    List<SysResourceDto> listUserResources(Map<String, Object> map);

    List<SysResourceDto> queryResourcesListWithSelected(String rid);

    List<SysResourceDto> listUrlAndPermission();

    List<SysResourceDto> listAllAvailableMenu();

    List<SysResourceDto> listByUserId(String userId);

    List<SysResourceDto> listAll();
}
