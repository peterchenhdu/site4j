/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.mapper;

import club.peterchenhdu.biz.entity.BizTags;
import club.peterchenhdu.biz.dto.req.TagsConditionVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Repository
public interface BizTagsMapper extends BaseMapper<BizTags> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<BizTags> findPageBreakByCondition(TagsConditionVO vo);

    List<BizTags> findByName(String name);
}
