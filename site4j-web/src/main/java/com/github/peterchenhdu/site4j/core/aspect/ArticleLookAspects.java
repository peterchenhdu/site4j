/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.core.aspect;

import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import com.github.peterchenhdu.site4j.biz.dto.ArticleLookDto;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.ArticleLookService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.common.util.web.IpUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.web.WebUtils;
import com.github.peterchenhdu.site4j.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 文章浏览记录aop操作
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Component
@Aspect
@Order(1)
public class ArticleLookAspects {

    @Autowired
    private BizArticleService bizArticleService;
    @Autowired
    private ArticleLookService articleLookService;

    /**
     * 切面切入点
     */
    @Pointcut("execution(* com.github.peterchenhdu.site4j.biz.controller.front.RenderController.article(..))")
    public void pointcut() {

    }

    @Before("pointcut()")
    public void doBefore(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        if (args != null && args.length > 0) {
            //获取请求来源的ID
            String userIp = IpUtils.getRealIp(WebUtils.getRequest());
            //文章ID
            String articleId =  args[1].toString();
            ArticleDto bizArticle = bizArticleService.queryById(articleId);
            //判断文章是否存在
            if (ObjectUtils.isEmpty(bizArticle)) {
                log.warn("{}-该文章不存在！", articleId);
                return;
            }

            //保存浏览记录
            ArticleLookDto articleLook = new ArticleLookDto();
            articleLook.setArticleId(articleId);
            articleLook.setUserIp(userIp);
            articleLook.setArticleName(bizArticle.getTitle());
            articleLook.setLookTime(LocalDateTime.now());
            if (SessionUtil.getUser() != null) {
                articleLook.setUserId(SessionUtil.getUser().getId());
            }
            articleLookService.save(articleLook);
        }
    }
}
