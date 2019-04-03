/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.service.sitemgt;


import com.github.peterchenhdu.site4j.biz.dto.TemplateDto;
import com.github.peterchenhdu.site4j.biz.entity.SysTemplate;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;
import com.github.peterchenhdu.site4j.biz.dto.req.TemplateConditionVO;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import com.baomidou.mybatisplus.service.IService;

/**
 * 系统模板
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public interface SysTemplateService extends IService<SysTemplate> {

    /**
     * 分页查询
     *
     * @param vo
     * @return
     */
    PageInfoDto<TemplateDto> findPageBreakByCondition(TemplateConditionVO vo);

    /**
     * 通过key获取模板信息
     *
     * @param key
     * @return
     */
    TemplateDto getTemplate(TemplateKeyEnum key);

    TemplateDto getOneByEntity(TemplateDto entity);
    TemplateDto getByPrimaryKey(String primaryKey);
    boolean updateSelective(TemplateDto entity);
    boolean removeByPrimaryKey(String primaryKey);
    TemplateDto insert(TemplateDto entity);
}
