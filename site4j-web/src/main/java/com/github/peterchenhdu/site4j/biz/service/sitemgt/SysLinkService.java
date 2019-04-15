/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.LinkDto;
import com.github.peterchenhdu.site4j.biz.dto.req.LinkConditionVO;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;

import java.util.List;

/**
 * 友情链接
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public interface SysLinkService {

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity entity
     * @return LinkDto
     */
    LinkDto insert(LinkDto entity);


    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    boolean removeByPrimaryKey(String primaryKey);


    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity entity
     * @return boolean
     */
    boolean updateSelective(LinkDto entity);

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return LinkDto
     */
    LinkDto getByPrimaryKey(String primaryKey);


    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return List
     */
    List<LinkDto> listAll();


    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    PageInfoDto<LinkDto> findPageBreakByCondition(LinkConditionVO vo);

    /**
     * 查询可在首页显示的友情链接列表
     *
     * @return List
     */
    List<LinkDto> listOfIndex();

}
