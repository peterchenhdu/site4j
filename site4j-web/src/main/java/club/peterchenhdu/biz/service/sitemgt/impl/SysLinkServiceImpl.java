/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt.impl;

import club.peterchenhdu.common.annotation.RedisCache;
import club.peterchenhdu.biz.dto.LinkDto;
import club.peterchenhdu.biz.entity.SysLink;
import club.peterchenhdu.biz.mapper.SysLinkMapper;
import club.peterchenhdu.biz.service.common.MailService;
import club.peterchenhdu.biz.service.sitemgt.SysConfigService;
import club.peterchenhdu.biz.service.sitemgt.SysLinkService;
import club.peterchenhdu.common.exception.LinkException;
import club.peterchenhdu.common.util.ObjectUtils;
import club.peterchenhdu.common.util.PageInfo;
import club.peterchenhdu.common.util.UuidUtils;
import club.peterchenhdu.biz.dto.req.LinkConditionVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
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
@Slf4j
@Service
public class SysLinkServiceImpl implements SysLinkService {

    @Autowired
    private SysLinkMapper sysLinkMapper;
    @Autowired
    private MailService mailService;
    @Autowired
    private SysConfigService configService;

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    @Override
    public PageInfo<LinkDto> findPageBreakByCondition(LinkConditionVO vo) {

        Wrapper<SysLink> example = new EntityWrapper<>();

        if(ObjectUtils.isNotEmpty(vo.getStatus())) {
            example.eq("status", vo.getStatus());
        }

        if(ObjectUtils.isNotEmpty(vo.getHomePageDisplay())) {
            example.eq("home_page_display", vo.getHomePageDisplay());
        }
        example.orderBy("status ASC, create_time DESC");

        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<SysLink> list = sysLinkMapper.selectList(example);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<LinkDto> boList = new ArrayList<>();
        for (SysLink sysLink : list) {
            boList.add(new LinkDto(sysLink));
        }
        return new PageInfo<>(PageHelper.getTotal(), boList);
    }

    /**
     * 查询可在首页显示的友情链接列表
     *
     * @return
     */
    @Override
    @RedisCache
    public List<LinkDto> listOfIndex() {
        LinkConditionVO vo = new LinkConditionVO(true, true);
        vo.setPageSize(100);
        PageInfo<LinkDto> pageInfo = this.findPageBreakByCondition(vo);
        return pageInfo == null ? null : pageInfo.getList();
    }

    /**
     * 查询可在内页显示的友情链接列表
     *
     * @return
     */
    @Override
    @RedisCache
    public List<LinkDto> listOfInside() {
        LinkConditionVO vo = new LinkConditionVO(true, false);
        vo.setPageSize(100);
        PageInfo<LinkDto> pageInfo = this.findPageBreakByCondition(vo);
        return pageInfo == null ? null : pageInfo.getList();
    }

    /**
     * 查询已禁用的友情链接列表
     *
     * @return
     */
    @Override
    @RedisCache
    public List<LinkDto> listOfDisable() {
        LinkConditionVO vo = new LinkConditionVO(true, null);
        vo.setPageSize(100);
        PageInfo<LinkDto> pageInfo = this.findPageBreakByCondition(vo);
        return pageInfo == null ? null : pageInfo.getList();
    }

    /**
     * 分组获取所有连接
     * {indexList:首页显示,insideList:内页,disableList:禁用}
     *
     * @return
     */
    @Override
    @RedisCache
    public Map<String, List<LinkDto>> listAllByGroup() {
        // 首页连接
        List<LinkDto> listOfIndex = this.listOfIndex();
        // 内页连接
        List<LinkDto> listOfInside = this.listOfInside();
        // 已禁用的连接
        List<LinkDto> listOfDisable = this.listOfDisable();
        Map<String, List<LinkDto>> resultMap = new HashMap<>();
        resultMap.put("indexList", listOfIndex);
        resultMap.put("insideList", listOfInside);
        resultMap.put("disableList", listOfDisable);
        return resultMap;
    }

    /**
     * 自动添加友链
     *
     * @param link
     * @return
     */
    @Override
    @RedisCache(flush = true)
    public boolean autoLink(LinkDto link) throws LinkException {
//        String url = link.getUrl();
//        LinkDto bo = getOneByUrl(url);
//        if (bo != null) {
//            throw new LinkException("本站已经添加过贵站的链接！");
//        }
//        ConfigDto config = configService.get();
//        if (!(LinksUtil.hasLinkByHtml(url, config.getDomain()))
//                && !LinksUtil.hasLinkByChinaz(url, config.getDomain())) {
//            throw new LinkException("贵站暂未添加本站友情链接！请先添加本站友链后重新提交申请！");
//        }
//
//        link.setSource(LinkSourceEnum.AUTOMATIC);
//        link.setStatus(true);
//        if (!StringUtils.isEmpty(link.getEmail())) {
//            link.setEmail(HtmlUtil.html2Text(link.getEmail()));
//        }
//        if (!StringUtils.isEmpty(link.getFavicon())) {
//            link.setFavicon(HtmlUtil.html2Text(link.getFavicon()));
//        }
//        if (!StringUtils.isEmpty(link.getName())) {
//            link.setName(HtmlUtil.html2Text(link.getName()));
//        }
//        if (!StringUtils.isEmpty(link.getUrl())) {
//            link.setUrl(HtmlUtil.html2Text(link.getUrl()));
//        }
//        if (!StringUtils.isEmpty(link.getDescription())) {
//            link.setDescription(HtmlUtil.html2Text(link.getDescription()));
//        }
//        this.insert(link);
//        log.info("友联自动申请成功,开始发送邮件通知...");
//        mailService.send(link, TemplateKeyEnum.TM_LINKS);
        return false;
    }

    /**
     * 保存一个实体，null的属性不会保存，会使用数据库默认值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public LinkDto insert(LinkDto entity) {
        Assert.notNull(entity, "Link不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setStatus(entity.isStatus());
        entity.setHomePageDisplay(entity.isHomePageDisplay());
        entity.setId(UuidUtils.getUuid());
        sysLinkMapper.insert(entity.getSysLink());
        return entity;
    }



    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean removeByPrimaryKey(String primaryKey) {
        return sysLinkMapper.deleteById(primaryKey) > 0;
    }

    /**
     * 根据主键更新实体全部字段，null值会被更新
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean update(LinkDto entity) {
        Assert.notNull(entity, "Link不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setStatus(entity.isStatus());
        entity.setHomePageDisplay(entity.isHomePageDisplay());
        return sysLinkMapper.updateAllColumnById(entity.getSysLink()) > 0;
    }

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean updateSelective(LinkDto entity) {
        Assert.notNull(entity, "Link不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setStatus(entity.isStatus());
        entity.setHomePageDisplay(entity.isHomePageDisplay());
        return sysLinkMapper.updateById(entity.getSysLink()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public LinkDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        SysLink entity = sysLinkMapper.selectById(primaryKey);
        return null == entity ? null : new LinkDto(entity);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    @RedisCache
    public LinkDto getOneByEntity(LinkDto entity) {
        Assert.notNull(entity, "Link不可为空！");
        SysLink bo = sysLinkMapper.selectOne(entity.getSysLink());
        return null == bo ? null : new LinkDto(bo);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param url
     * @return
     */
    @Override
    public LinkDto getOneByUrl(String url) {
        LinkDto l = new LinkDto();
        l.setUrl(url);
        return getOneByEntity(l);
    }

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    @Override
    public List<LinkDto> listAll() {
        return null;
    }

    /**
     * 根据实体中的属性值进行查询，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    public List<LinkDto> listByEntity(LinkDto entity) {
        return null;
    }


}
