/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.mapper;

import club.peterchenhdu.biz.dto.ResourcesDto;
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
    List<ResourcesDto> findPageBreakByCondition(Page<ResourcesDto> page, ResourceConditionVO vo);

    List<ResourcesDto> listUserResources(Map<String, Object> map);

    List<ResourcesDto> listByUserId(String userId);

}
