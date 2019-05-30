/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.core.runner.service;

import com.github.peterchenhdu.site4j.common.util.holder.SpringContextHolder;
import com.github.peterchenhdu.site4j.core.job.base.AbstractBaseCronJob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 初始化服务
 * <p>
 * Created by PiChen on 2019/5/30.
 */
@Service
public class InitService {
    @Autowired
    private SchedulerFactoryBean schedulerFactoryBean;

    @Async
    public void init() {
        //程序启动完成，执行一些初始化操作
        ApplicationContext appContext = SpringContextHolder.getApplicationContext();

        //启动所有任务
        Map<String, AbstractBaseCronJob> map = appContext.getBeansOfType(AbstractBaseCronJob.class);
        map.values().forEach(AbstractBaseCronJob::scheduleJobs);

        schedulerFactoryBean.start();
    }
}
