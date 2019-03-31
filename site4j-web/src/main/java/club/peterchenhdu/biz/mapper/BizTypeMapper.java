/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.mapper;

import club.peterchenhdu.biz.entity.BizType;
import club.peterchenhdu.biz.dto.req.TypeConditionVO;
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
public interface BizTypeMapper extends BaseMapper<BizType> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    List<BizType> findPageBreakByCondition(TypeConditionVO vo);

    List<BizType> listParent();

    List<BizType> listTypeForMenu();

    List<BizType> findByName(String name);
}
