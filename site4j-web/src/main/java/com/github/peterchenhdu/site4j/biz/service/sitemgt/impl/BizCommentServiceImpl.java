/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.PageHelper;
import com.github.peterchenhdu.site4j.biz.dto.BizCommentDto;
import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentConditionVO;
import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.biz.mapper.BizCommentMapper;
import com.github.peterchenhdu.site4j.biz.service.common.MailService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.IpUtils;
import com.github.peterchenhdu.site4j.common.util.holder.RequestHolder;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.util.*;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import eu.bitwalker.useragentutils.Version;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.TimeUnit;

/**
 * 评论
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Slf4j
@Service
public class BizCommentServiceImpl implements BizCommentService {

    @Autowired
    private BizCommentMapper bizCommentMapper;

    @Autowired
    private RedisTemplate redisTemplate;

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
    public PageInfoDto<CommentDto> findPageBreakByCondition(CommentConditionVO vo) {
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizComment> list = bizCommentMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<CommentDto> boList = new ArrayList<>();
        for (BizComment bizComment : list) {
            boList.add(new CommentDto(bizComment));
        }

        return new PageInfoDto<>(PageHelper.getTotal(), boList);
    }

    /**
     * @param vo
     * @return
     */
    @Override
//    @RedisCache
    public Map<String, Object> list(CommentConditionVO vo) {
        PageInfoDto pageInfo = findPageBreakByCondition(vo);
        Map<String, Object> map = new HashMap<>();
        if (pageInfo != null) {
            map.put("commentList", convert2DTO(pageInfo.getList()));
            map.put("total", pageInfo.getTotal());
            map.put("nextPage", pageInfo.getNextPage());
        }
        return map;
    }

    private List<BizCommentDto> convert2DTO(List<CommentDto> list) {
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<BizCommentDto> dtoList = new LinkedList<>();
        for (CommentDto comment : list) {
            BizCommentDto dto = BeanConvertUtils.doConvert(comment, BizCommentDto.class);
            dto.setParentDTO(BeanConvertUtils.doConvert(comment.getParent(), BizCommentDto.class));
            dtoList.add(dto);
        }
        return dtoList;
    }

    /**
     * admin发表评论
     *
     * @param comment
     * @return
     */
    @Override
    @RedisCache(flush = true)
    public void commentForAdmin(CommentDto comment)  {
        ConfigDto config = configService.get();
        UserDto user = SessionUtil.getUser();
        comment.setEmail(user.getEmail());
        comment.setNickname(user.getNickname());
        comment.setAvatar(user.getAvatar());
        comment.setUrl(config.getSiteUrl());
        comment.setUserId(user.getId());
        comment.setStatus(CommentStatusEnum.APPROVED.toString());
        comment.setPid(comment.getId());
        comment.setId(null);
        this.comment(comment);
    }

    /**
     * 发表评论
     *
     * @param comment
     * @return
     */
    @Override
    @RedisCache(flush = true)
    public CommentDto comment(CommentDto comment)  {
        if (StringUtils.isEmpty(comment.getNickname())) {
            throw new CommonRuntimeException("必须输入昵称哦~~");
        }
        String content = comment.getContent();
        if (!XssKillerUtil.isValid(content)) {
            throw new CommonRuntimeException("内容不合法，请不要使用特殊标签哦~~");
        }
        content = XssKillerUtil.clean(content.trim()).replaceAll("(<p><br></p>)|(<p></p>)", "");
        if (StringUtils.isEmpty(content) || "\n".equals(content)) {
            throw new CommonRuntimeException("不说话可不行，必须说点什么哦~~");
        }
        // 过滤非法属性和无用的空标签
        comment.setContent(content);
        comment.setNickname(HtmlUtil.html2Text(comment.getNickname()));
        comment.setQq(HtmlUtil.html2Text(comment.getQq()));
        comment.setAvatar(HtmlUtil.html2Text(comment.getAvatar()));
        comment.setEmail(HtmlUtil.html2Text(comment.getEmail()));
        comment.setUrl(HtmlUtil.html2Text(comment.getUrl()));
        HttpServletRequest request = RequestHolder.getRequest();
        String ua = request.getHeader("User-Agent");
        UserAgent agent = UserAgent.parseUserAgentString(ua);
        // 浏览器
        Browser browser = agent.getBrowser();
        String browserInfo = browser.getName();
//        comment.setBrowserShortName(browser.getShortName());// 此处需开发者自己处理
        // 浏览器版本
        Version version = agent.getBrowserVersion();
        if (version != null) {
            browserInfo += " " + version.getVersion();
        }
        comment.setBrowser(browserInfo);
        // 操作系统
        OperatingSystem os = agent.getOperatingSystem();
        comment.setOs(os.getName());
//        comment.setOsShortName(os.getShortName());// 此处需开发者自己处理
        comment.setIp(IpUtils.getRealIp(request));
        String address = "定位失败";
        ConfigDto config = configService.get();
//        try {
//            String locationJson = RestClientUtil.get(UrlBuildUtil.getLocationByIp(comment.getIp(), config.getBaiduApiAk()));
//            JSONObject localtionContent = JSONObject.parseObject(locationJson).getJSONObject("content");
//            // 地址详情
//            JSONObject addressDetail = localtionContent.getJSONObject("address_detail");
//            // 省
//            String province = addressDetail.getString("province");
//            // 市
//            String city = addressDetail.getString("city");
//            // 区
//            String district = addressDetail.getString("district");
//            // 街道
//            String street = addressDetail.getString("street");
//            // 街道编号
////            String street_number = addressDetail.getString("street_number");
//            StringBuffer sb = new StringBuffer(province);
//            if (!StringUtils.isEmpty(city)) {
//                sb.append(city);
//            }
//            if (!StringUtils.isEmpty(district)) {
//                sb.append(district);
//            }
//            if (!StringUtils.isEmpty(street)) {
//                sb.append(street);
//            }
//            address = sb.toString();
//            // 经纬度
//            JSONObject point = localtionContent.getJSONObject("point");
//            // 纬度
//            String lat = point.getString("y");
//            // 经度
//            String lng = point.getString("x");
//            comment.setLat(lat);
//            comment.setLng(lng);
//            comment.setAddress(address);
//        } catch (Exception e) {
            comment.setAddress("未知");
//            log.error("获取地址失败", e);
//        }
        if (StringUtils.isEmpty(comment.getStatus())) {
            comment.setStatus(CommentStatusEnum.VERIFYING.toString());
        }
        this.insert(comment);
        this.sendEmail(comment);
        return comment;
    }


    private void sendEmail(CommentDto comment) {
        // 发送邮件通知，此处如发生异常不应阻塞当前的业务流程
        // 可以进行日志记录等操作
        try {
            if (null != comment.getPid()) {
                // 给被评论的用户发送通知
                CommentDto commentDB = this.getByPrimaryKey(comment.getPid());
                mailService.send(commentDB, TemplateKeyEnum.TM_COMMENT_REPLY, false);
            } else {
                mailService.sendToAdmin(comment);
            }
        } catch (Exception e) {
            log.error("发送评论通知邮件时发生异常", e);
        }
    }

    /**
     * 查询近期评论
     *
     * @param pageSize
     * @return
     */
    @Override
    @RedisCache
    public List<CommentDto> listRecentComment(int pageSize) {
        CommentConditionVO vo = new CommentConditionVO();
        vo.setPageSize(pageSize);
        vo.setStatus(CommentStatusEnum.APPROVED.toString());
        PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
        List<BizComment> list = bizCommentMapper.findPageBreakByCondition(vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<CommentDto> boList = new ArrayList<>();
        for (BizComment bizComment : list) {
            boList.add(new CommentDto(bizComment));
        }
        return boList;
    }

    /**
     * 查询未审核的评论
     *
     * @param pageSize
     * @return
     */
    @Override
    public List<CommentDto> listVerifying(int pageSize) {
        CommentConditionVO vo = new CommentConditionVO();
        vo.setPageSize(pageSize);
        vo.setStatus(CommentStatusEnum.VERIFYING.toString());
        PageInfoDto pageInfo = findPageBreakByCondition(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 点赞
     *
     * @param id
     */
    @Override
    @RedisCache(flush = true)
    public void doSupport(String id) {
        String key = IpUtils.getRealIp(RequestHolder.getRequest()) + "_doSupport_" + id;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        if (redisTemplate.hasKey(key)) {
            throw new CommonRuntimeException("一个小时只能点一次赞哈~");
        }
        bizCommentMapper.doSupport(id);
        operations.set(key, id, 1, TimeUnit.HOURS);
    }

    /**
     * 点踩
     *
     * @param id
     */
    @Override
    @RedisCache(flush = true)
    public void doOppose(String id) {
        String key = IpUtils.getRealIp(RequestHolder.getRequest()) + "_doOppose_" + id;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        if (redisTemplate.hasKey(key)) {
            throw new CommonRuntimeException("一个小时只能踩一次哈~又没什么深仇大恨");
        }
        bizCommentMapper.doOppose(id);
        operations.set(key, id, 1, TimeUnit.HOURS);
    }

    @Override
    public int queryCount() {
        Wrapper<BizComment> example = new EntityWrapper<>();
        example.eq("status", "APPROVED");
        return bizCommentMapper.selectCount(example);
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
    public CommentDto insert(CommentDto entity) {
        Assert.notNull(entity, "Comment不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        bizCommentMapper.insert(entity.getBizComment());
        return entity;
    }

    /**
     * 批量插入，支持批量插入的数据库可以使用，例如MySQL,H2等，另外该接口限制实体包含id属性并且必须为自增列
     *
     * @param entities
     */
    @Override
    public void insertList(List<CommentDto> entities) {

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
        return bizCommentMapper.deleteById(primaryKey) > 0;
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
    public boolean update(CommentDto entity) {
        Assert.notNull(entity, "Comment不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return bizCommentMapper.updateAllColumnById(entity.getBizComment()) > 0;
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
    public boolean updateSelective(CommentDto entity) {
        Assert.notNull(entity, "Comment不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return bizCommentMapper.updateById(entity.getBizComment()) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey
     * @return
     */
    @Override
    public CommentDto getByPrimaryKey(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizComment entity = bizCommentMapper.getById(primaryKey);
        return null == entity ? null : new CommentDto(entity);
    }

    /**
     * 根据实体中的属性进行查询，只能有一个返回值，有多个结果时抛出异常，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    public CommentDto getOneByEntity(CommentDto entity) {
        Assert.notNull(entity, "Comment不可为空！");
        BizComment bo = bizCommentMapper.selectOne(entity.getBizComment());
        return null == bo ? null : new CommentDto(bo);
    }

    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return
     */
    @Override
    public List<CommentDto> listAll() {
        List<BizComment> entityList = bizCommentMapper.selectList(new EntityWrapper<>());

        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<CommentDto> list = new ArrayList<>();
        for (BizComment entity : entityList) {
            list.add(new CommentDto(entity));
        }
        return list;
    }

    /**
     * 根据实体中的属性值进行查询，查询条件使用等号
     *
     * @param entity
     * @return
     */
    @Override
    public List<CommentDto> listByEntity(CommentDto entity) {
        return null;
    }


}