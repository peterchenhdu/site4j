/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.core.aspect;

import club.peterchenhdu.biz.dto.ArticleDto;
import club.peterchenhdu.biz.dto.ArticleLookDto;
import club.peterchenhdu.biz.service.articlemgt.BizArticleLookService;
import club.peterchenhdu.biz.service.articlemgt.BizArticleService;
import club.peterchenhdu.common.util.IpUtils;
import club.peterchenhdu.common.util.ObjectUtils;
import club.peterchenhdu.util.RequestHolder;
import club.peterchenhdu.util.SessionUtil;
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
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
 */
@Slf4j
@Component
@Aspect
@Order(1)
public class ArticleLookAspects {

    @Autowired
    private BizArticleService bizArticleService;
    @Autowired
    private BizArticleLookService articleLookService;

    /**
     * 切面切入点
     */
    @Pointcut("execution(* club.peterchenhdu.biz.web.front.controller.RenderController.article(..))")
    public void pointcut() {

    }

    @Before("pointcut()")
    public void doBefore(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        if (args != null && args.length > 0) {
            //获取请求来源的ID
            String userIp = IpUtils.getRealIp(RequestHolder.getRequest());
            //文章ID
            String articleId =  args[1].toString();
            ArticleDto bizArticle = bizArticleService.getByPrimaryKey(articleId);
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
            articleLookService.insert(articleLook);
        }
    }
}
