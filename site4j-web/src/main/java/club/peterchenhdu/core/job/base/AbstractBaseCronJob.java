/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.core.job.base;

import club.peterchenhdu.core.job.SiteInfoStatJob;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import static org.quartz.CronScheduleBuilder.cronSchedule;

/**
 * AbstractBaseCronJob
 *
 * @author PiChen
 * @since 2019/2/3
 */
public abstract class AbstractBaseCronJob implements Job {

    /**
     * cron表达式
     */
    private String cron;
    /**
     * 服务启动时是否运行
     */
    private boolean executeAtServiceStart = false;
    private JobExecutionContext context;

    @Autowired
    private SchedulerFactoryBean schedulerFactoryBean;

    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        this.context = context;
        execute();

    }

    public abstract void initParam();

    public abstract void execute();


    public void scheduleJobs() {
        this.initParam();

        String className = this.getClass().getSimpleName();

        Scheduler scheduler = schedulerFactoryBean.getScheduler();

//        JobDataMap jobDataMap = new JobDataMap();
//        jobDataMap.put("jobArg", "world");
        JobDetail jobDetail = JobBuilder.newJob(SiteInfoStatJob.class)
//                .setJobData(jobDataMap)
//                .withDescription("demo")
                .withIdentity(className + "-Job", className + "-JobGroup")
                .build();

        Trigger trigger = TriggerBuilder.newTrigger()
                .forJob(jobDetail)
                .withIdentity(className + "Trigger", className + "TriggerGroup")
                .withSchedule(cronSchedule(cron))
                .build();


        try {

            scheduler.scheduleJob(jobDetail, trigger);
            scheduler.start();

            if (executeAtServiceStart) {
                this.execute();
            }

        } catch (SchedulerException e) {
            e.printStackTrace();
        }

    }

    public String getCron() {
        return cron;
    }

    public void setCron(String cron) {
        this.cron = cron;
    }

    public boolean isExecuteAtServiceStart() {
        return executeAtServiceStart;
    }

    public void setExecuteAtServiceStart(boolean executeAtServiceStart) {
        this.executeAtServiceStart = executeAtServiceStart;
    }

    public JobExecutionContext getContext() {
        return context;
    }

    public void setContext(JobExecutionContext context) {
        this.context = context;
    }
}
