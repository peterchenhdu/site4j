/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.service.sitemgt;


import club.peterchenhdu.biz.dto.TemplateDto;
import club.peterchenhdu.biz.entity.SysTemplate;
import club.peterchenhdu.common.enums.TemplateKeyEnum;
import club.peterchenhdu.biz.web.vo.TemplateConditionVO;
import com.baomidou.mybatisplus.service.IService;
import club.peterchenhdu.common.util.PageInfo;

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
    PageInfo<TemplateDto> findPageBreakByCondition(TemplateConditionVO vo);

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
