/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config.freemarker;

import com.github.peterchenhdu.site4j.biz.dto.CommonInfoDto;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.config.freemarker.template.ArticleTagDirective;
import com.github.peterchenhdu.site4j.config.freemarker.template.CustomTagDirective;
import com.github.peterchenhdu.site4j.config.freemarker.template.SearchLabelDirective;
import com.jagregory.shiro.freemarker.ShiroTags;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.SimpleDate;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * freemarker配置类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Configuration
public class FreeMarkerConfig {

    @Autowired
    protected freemarker.template.Configuration configuration;
    @Autowired
    protected CustomTagDirective customTagDirective;
    @Autowired
    protected ArticleTagDirective articleTagDirective;
    @Autowired
    private SysConfigService configService;

    @Autowired
    private SearchLabelDirective searchLabelDirective;

    /**
     * 添加自定义标签(设置共享变量)
     */
    @PostConstruct
    public void setSharedVariable() {

        //设置共享变量
        configuration.setSharedVariable("site4jTag", customTagDirective);
        configuration.setSharedVariable("articleTag", articleTagDirective);
        configuration.setSharedVariable("searchLabel", searchLabelDirective);


        CommonInfoDto commonInfoDto = new CommonInfoDto();
        int nowHours= LocalDateTime.now().getHour();
        String msg = nowHours <= 5 ? "凌晨好" : nowHours <= 9 ? "早上好" : nowHours <= 12 ? "上午好" :
                nowHours <= 13 ? "中午好" : nowHours <= 18 ? "下午好" : "晚上好";
        commonInfoDto.setHelloMsg(msg);

        try {
            configuration.setSharedVariable("commonInfoDto", commonInfoDto);
            configuration.setSharedVariable("config", configService.get());
            //shiro标签
            configuration.setSharedVariable("shiro", new ShiroTags());
        } catch (TemplateModelException e) {
            e.printStackTrace();
        }

        configuration.setObjectWrapper(new DefaultObjectWrapper(freemarker.template.Configuration.VERSION_2_3_28) {
            @Override
            public TemplateModel wrap(Object obj) throws TemplateModelException {
                if (obj instanceof LocalDateTime) {
                    Timestamp timestamp = Timestamp.valueOf((LocalDateTime) obj);
                    return new SimpleDate(timestamp);
                }
                if (obj instanceof LocalDate) {
                    Date date = Date.valueOf((LocalDate) obj);
                    return new SimpleDate(date);
                }
                if (obj instanceof LocalTime) {
                    Time time = Time.valueOf((LocalTime) obj);
                    return new SimpleDate(time);
                }
                return super.wrap(obj);
            }
        });
    }


}
