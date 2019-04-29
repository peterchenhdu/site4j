/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.peterchenhdu.site4j.biz.dto.BizCommentDto;
import com.github.peterchenhdu.site4j.biz.dto.CommentDto;
import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.biz.dto.req.CommentQueryDto;
import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.biz.mapper.BizCommentMapper;
import com.github.peterchenhdu.site4j.biz.service.common.MailService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.annotation.RedisCache;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.github.peterchenhdu.site4j.common.exception.CommonRuntimeException;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.PageUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.common.util.web.IpUtils;
import com.github.peterchenhdu.site4j.common.util.web.WebUtils;
import com.github.peterchenhdu.site4j.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;
import com.github.peterchenhdu.site4j.util.BeanConvertUtils;
import com.github.peterchenhdu.site4j.util.HtmlUtil;
import com.github.peterchenhdu.site4j.util.SessionUtil;
import com.github.peterchenhdu.site4j.util.XssKillerUtil;
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
import java.util.stream.Collectors;

/**
 * 评论
 *
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Service
public class BizCommentServiceImpl implements BizCommentService {

    @Autowired
    private BizCommentMapper bizCommentMapper;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Autowired
    private MailService mailService;

    @Autowired
    private SysConfigService configService;

    /**
     * 分页查询
     *
     * @param vo vo
     * @return PageInfoDto
     */
    @Override
    public PageInfoDto<CommentDto> query(CommentQueryDto vo) {
        Page<BizComment> page = PageUtils.getPage(vo);
        List<CommentDto> boList = bizCommentMapper.query(page, vo).stream()
                .map(dto-> BeanConvertUtils.doConvert(dto, CommentDto.class))
                .collect(Collectors.toList());

        return new PageInfoDto<>(page.getTotal(), boList);
    }

    /**
     * @param vo vo
     * @return Map
     */
    @Override
    public Map<String, Object> list(CommentQueryDto vo) {
        PageInfoDto<CommentDto> pageInfo = query(vo);
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
            if(ObjectUtils.isEmpty(dto)) continue;
            dto.setParentDTO(BeanConvertUtils.doConvert(comment.getParent(), BizCommentDto.class));
            dtoList.add(dto);
        }
        return dtoList;
    }

    /**
     * admin发表评论
     *
     * @param comment comment
     */
    @Override
    public void commentForAdmin(CommentDto comment)  {
        ConfigDto config = configService.get();
        UserDto user = SessionUtil.getUser();
        if(ObjectUtils.isNotEmpty(user)) {
            comment.setEmail(user.getEmail());
            comment.setNickname(user.getNickname());
            comment.setAvatar(user.getAvatar());
            comment.setUserId(user.getId());
        }
        comment.setUrl(config.getSiteUrl());
        comment.setStatus(CommentStatusEnum.APPROVED.toString());
        comment.setPid(comment.getId());
        comment.setId(null);
        this.comment(comment);
    }

    /**
     * 发表评论
     *
     * @param comment comment
     * @return CommentDto
     */
    @Override
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
            throw new CommonRuntimeException("内容不能为空~~");
        }
        // 过滤非法属性和无用的空标签
        comment.setContent(content);
        comment.setNickname(HtmlUtil.html2Text(comment.getNickname()));
        comment.setQq(HtmlUtil.html2Text(comment.getQq()));
        comment.setAvatar(HtmlUtil.html2Text(comment.getAvatar()));
        comment.setEmail(HtmlUtil.html2Text(comment.getEmail()));
        comment.setUrl(HtmlUtil.html2Text(comment.getUrl()));
        HttpServletRequest request = WebUtils.getRequest();

        if(ObjectUtils.isNotEmpty(request)) {
            String ua = request.getHeader("User-Agent");
            UserAgent agent = UserAgent.parseUserAgentString(ua);
            // 浏览器
            Browser browser = agent.getBrowser();
            String browserInfo = browser.getName();
            // 浏览器版本
            Version version = agent.getBrowserVersion();
            if (version != null) {
                browserInfo += " " + version.getVersion();
            }
            comment.setBrowser(browserInfo);
            // 操作系统
            OperatingSystem os = agent.getOperatingSystem();
            comment.setOs(os.getName());
            comment.setIp(IpUtils.getRealIp(request));
        }

        if (StringUtils.isEmpty(comment.getStatus())) {
            comment.setStatus(CommentStatusEnum.VERIFYING.toString());
        }
        this.save(comment);
        this.sendEmail(comment);
        return comment;
    }


    /**
     * 发送邮件通知
     * @param comment comment
     */
    private void sendEmail(CommentDto comment) {
        // 发送邮件通知，此处如发生异常不应阻塞当前的业务流程
        // 可以进行日志记录等操作
        try {
            if (null != comment.getPid()) {
                // 给被评论的用户发送通知
                CommentDto commentDB = this.queryById(comment.getPid());
                mailService.send(commentDB, TemplateKeyEnum.COMMENT_REPLY, false);
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
     * @param pageSize pageSize
     * @return List
     */
    @Override
//    @RedisCache
    public List<CommentDto> listRecentComment(int pageSize) {
        CommentQueryDto vo = new CommentQueryDto();
        vo.setPageSize(pageSize);
        Page<BizComment> page = PageUtils.getPage(vo);
        List<BizComment> list = bizCommentMapper.query(page, vo);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        }
        List<CommentDto> boList = new ArrayList<>();
        for (BizComment bizComment : list) {
            boList.add(BeanConvertUtils.doConvert(bizComment, CommentDto.class));
        }
        return boList;
    }

    /**
     * 查询未审核的评论
     *
     * @param pageSize pageSize
     * @return List
     */
    @Override
    public List<CommentDto> listVerifying(int pageSize) {
        CommentQueryDto vo = new CommentQueryDto();
        vo.setPageSize(pageSize);
        vo.setStatus(CommentStatusEnum.VERIFYING.toString());
        PageInfoDto pageInfo = query(vo);
        return null == pageInfo ? null : pageInfo.getList();
    }

    /**
     * 点赞
     *
     * @param id id
     */
    @Override
    @RedisCache(flush = true)
    public void doSupport(String id) {
        String key = IpUtils.getRealIp(WebUtils.getRequest()) + "_doSupport_" + id;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        if (Boolean.TRUE.equals(redisTemplate.hasKey(key))) {
            throw new CommonRuntimeException("一个小时只能点一次赞哈~");
        }
        bizCommentMapper.doSupport(id);
        operations.set(key, id, 1, TimeUnit.HOURS);
    }

    /**
     * 点踩
     *
     * @param id id
     */
    @Override
    @RedisCache(flush = true)
    public void doOppose(String id) {
        String key = IpUtils.getRealIp(WebUtils.getRequest()) + "_doOppose_" + id;
        ValueOperations<String, Object> operations = redisTemplate.opsForValue();
        if (Boolean.TRUE.equals(redisTemplate.hasKey(key))) {
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
     * @param entity entity
     * @return CommentDto
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public CommentDto save(CommentDto entity) {
        Assert.notNull(entity, "Comment不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        entity.setCreateTime(LocalDateTime.now());
        entity.setId(UuidUtils.getUuid());
        bizCommentMapper.insert(entity);
        return entity;
    }




    /**
     * 根据主键字段进行删除，方法参数必须包含完整的主键属性
     *
     * @param primaryKey primaryKey
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean deleteById(String primaryKey) {
        return bizCommentMapper.deleteById(primaryKey) > 0;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public Integer deleteBySids(List<String> sidList) {
        Wrapper<BizComment> wrapper = new EntityWrapper<>();
        wrapper.in("sid", sidList);
        return bizCommentMapper.delete(wrapper);
    }

    /**
     * 根据主键更新属性不为null的值
     *
     * @param entity entity
     * @return boolean
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    @RedisCache(flush = true)
    public boolean updateSelective(CommentDto entity) {
        Assert.notNull(entity, "Comment不可为空！");
        entity.setUpdateTime(LocalDateTime.now());
        return bizCommentMapper.updateById(entity) > 0;
    }

    /**
     * 根据主键字段进行查询，方法参数必须包含完整的主键属性，查询条件使用等号
     *
     * @param primaryKey primaryKey
     * @return CommentDto
     */
    @Override
    public CommentDto queryById(String primaryKey) {
        Assert.notNull(primaryKey, "PrimaryKey不可为空！");
        BizComment entity = bizCommentMapper.getById(primaryKey);
        return null == entity ? null : BeanConvertUtils.doConvert(entity, CommentDto.class);
    }



    /**
     * 查询全部结果，listByEntity(null)方法能达到同样的效果
     *
     * @return List
     */
    @Override
    public List<CommentDto> listAll() {
        List<BizComment> entityList = bizCommentMapper.selectList(new EntityWrapper<>());

        if (CollectionUtils.isEmpty(entityList)) {
            return null;
        }
        List<CommentDto> list = new ArrayList<>();
        for (BizComment entity : entityList) {
            list.add(BeanConvertUtils.doConvert(entity, CommentDto.class));
        }
        return list;
    }




}
