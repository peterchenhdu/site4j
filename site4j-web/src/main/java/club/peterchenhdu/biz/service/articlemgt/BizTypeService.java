/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.articlemgt;


import club.peterchenhdu.biz.dto.TypeDto;
import club.peterchenhdu.biz.entity.BizType;
import club.peterchenhdu.biz.web.vo.TypeConditionVO;
import com.baomidou.mybatisplus.service.IService;
import club.peterchenhdu.common.util.PageInfo;

import java.util.List;

/**
 * 分类
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface BizTypeService extends IService<BizType> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<TypeDto> findPageBreakByCondition(TypeConditionVO vo);

    List<TypeDto> listParent();

    List<TypeDto> listTypeForMenu();

    int queryCount();

    TypeDto insert(TypeDto entity);
    List<TypeDto> listAll();
    TypeDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(TypeDto entity);
    boolean removeByPrimaryKey(String primaryKey);
}
