/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.core.aspect;

import com.github.peterchenhdu.site4j.biz.dto.ConfigDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.common.util.DateTimeUtils;
import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 提到core模块中，方便控制前后台
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
@Component
@Aspect
@Order(1)
public class RenderAspects {

    private static volatile long configLastUpdateTime = 0L;
    @Autowired
    protected Configuration configuration;
    @Autowired
    private SysConfigService configService;

    @Pointcut(value = "@annotation(org.springframework.web.bind.annotation.GetMapping)" +
            "|| @annotation(org.springframework.web.bind.annotation.RequestMapping)")
    public void pointcut() {
        // 切面切入点
    }

    @After("pointcut()")
    public void after(JoinPoint joinPoint) {
        ConfigDto config = configService.get();
        if (null == config) {
            log.error("config为空");
            return;
        }
        Long updateTime = DateTimeUtils.toTimestamp(config.getUpdateTime());
        if (updateTime == configLastUpdateTime) {
            log.info("config表未更新");
            return;
        }
        log.info("config表已更新，重新加载config到freemarker tag");
        configLastUpdateTime = updateTime;
        try {
            configuration.setSharedVariable("config", config);
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }
    }
}
