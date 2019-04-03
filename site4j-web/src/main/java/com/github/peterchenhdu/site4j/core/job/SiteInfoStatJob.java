/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.core.job;

import com.github.peterchenhdu.site4j.biz.entity.Dict;
import com.github.peterchenhdu.site4j.biz.mapper.DictMapper;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTagsService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTypeService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.constant.DictKeys;
import com.github.peterchenhdu.site4j.enums.DictTypeEnum;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import com.github.peterchenhdu.site4j.common.util.UuidUtils;
import com.github.peterchenhdu.site4j.core.job.base.AbstractBaseCronJob;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 网站数据统计任务
 */
@Component
public class SiteInfoStatJob extends AbstractBaseCronJob {
    @Autowired
    private DictMapper dictMapper;
    @Autowired
    private BizArticleService bizArticleService;
    @Autowired
    private BizTagsService bizTagsService;
    @Autowired
    private BizCommentService bizCommentService;
    @Autowired
    private BizTypeService bizTypeService;

    @Override
    public void initParam() {
        this.setCron("0 0 0/1 * * ?");
        this.setExecuteAtServiceStart(true);
    }

    @Override
    public void execute() {
        LogUtils.info("开始网站数据统计...");

        int articleCount = bizArticleService.queryCount();
        saveOrUpdate(DictTypeEnum.SYS_STAT.getType(), DictKeys.SYS_STAT_ARTICLE_COUNT, String.valueOf(articleCount));

        int tagCount = bizTagsService.queryCount();
        saveOrUpdate(DictTypeEnum.SYS_STAT.getType(), DictKeys.SYS_STAT_TAG_COUNT, String.valueOf(tagCount));

        int commentCount = bizCommentService.queryCount();
        saveOrUpdate(DictTypeEnum.SYS_STAT.getType(), DictKeys.SYS_STAT_COMMENT_COUNT, String.valueOf(commentCount));

        int typeCount = bizTypeService.queryCount();
        saveOrUpdate(DictTypeEnum.SYS_STAT.getType(), DictKeys.SYS_STAT_TYPE_COUNT, String.valueOf(typeCount));

        LogUtils.info("结束网站数据统计...");
    }


    private void saveOrUpdate(String type, String key, String value) {
        LocalDateTime now = LocalDateTime.now();

        Wrapper<Dict> wrapper = new EntityWrapper<>();
        wrapper.eq("dict_type", type);
        wrapper.eq("dict_key", key);
        List<Dict> list = dictMapper.selectList(wrapper);
        if (ObjectUtils.isEmpty(list)) {
            Dict dict = new Dict();
            dict.setCreateTime(now);
            dict.setUpdateTime(now);
            dict.setId(UuidUtils.getUuid());
            dict.setDictType(DictTypeEnum.SYS_STAT.getType());
            dict.setDictKey(key);
            dict.setDictValue(value);
            dictMapper.insert(dict);
        } else {
            Dict dict = list.get(0);
            dict.setDictValue(value);
            dict.setUpdateTime(now);
            dictMapper.updateById(dict);
        }
    }
}