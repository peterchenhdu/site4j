/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt;


import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.biz.dto.LinkDto;
import club.peterchenhdu.biz.web.vo.LinkConditionVO;
import club.peterchenhdu.common.exception.LinkException;

import java.util.List;
import java.util.Map;

/**
 * 友情链接
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysLinkService {

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    LinkDto insert(LinkDto entity);



    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    boolean removeByPrimaryKey(String primaryKey);

    /**
     * 根据主键更新实体全部字段，null值会被更新
     *
     * @param entity
     * @return
     */
    boolean update(LinkDto entity);

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    boolean updateSelective(LinkDto entity);

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    LinkDto getByPrimaryKey(String primaryKey);

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity
     * @return
     */
    LinkDto getOneByEntity(LinkDto entity);

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param url
     * @return
     */
    LinkDto getOneByUrl(String url);

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    List<LinkDto> listAll();

    /**
     * 根据实体中的属性值进行查询，查询条件使用等号
     *
     * @param entity
     * @return
     */
    List<LinkDto> listByEntity(LinkDto entity);

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfo<LinkDto> findPageBreakByCondition(LinkConditionVO vo);

    /**
     * 查询可在首页显示的友情链接列表
     *
     * @return
     */
    List<LinkDto> listOfIndex();

    /**
     * 查询可在内页显示的友情链接列表
     *
     * @return
     */
    List<LinkDto> listOfInside();

    /**
     * 查询已禁用的友情链接列表
     *
     * @return
     */
    List<LinkDto> listOfDisable();

    /**
     * 分组获取所有连接
     * {index:首页显示,inside:内页,disable:禁用}
     *
     * @return
     */
    Map<String, List<LinkDto>> listAllByGroup();

    /**
     * 自动添加友链
     *
     * @param link
     * @return
     */
    boolean autoLink(LinkDto link) throws LinkException;
}
