/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.web.front.controller;

import club.peterchenhdu.common.enums.TemplateKeyEnum;
import club.peterchenhdu.biz.service.articlemgt.BizArticleService;
import club.peterchenhdu.biz.service.articlemgt.BizTagsService;
import club.peterchenhdu.biz.service.articlemgt.BizTypeService;
import club.peterchenhdu.biz.service.sitemgt.SysConfigService;
import club.peterchenhdu.biz.service.sitemgt.SysTemplateService;
import club.peterchenhdu.util.FreeMarkerUtil;
import club.peterchenhdu.biz.dto.TemplateDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 站点相关的接口类，主要为sitemap和robots的生成
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
 */
@RestController
public class RestWebSiteController {
    @Autowired
    private BizArticleService articleService;
    @Autowired
    private BizTypeService typeService;
    @Autowired
    private BizTagsService tagsService;
    @Autowired
    private SysTemplateService templateService;
    @Autowired
    private SysConfigService configService;

    @GetMapping(value = "/sitemap.xml", produces = {"application/xml"})
    public String sitemapXml() {
        return getSitemap(TemplateKeyEnum.TM_SITEMAP_XML);
    }

    @GetMapping(value = "/sitemap.txt", produces = {"text/plain"})
    public String sitemapTxt() {
        return getSitemap(TemplateKeyEnum.TM_SITEMAP_TXT);
    }

    @GetMapping(value = "/sitemap.html", produces = {"text/html"})
    public String sitemapHtml() {
        return getSitemap(TemplateKeyEnum.TM_SITEMAP_HTML);
    }

    @GetMapping(value = "/robots.txt", produces = {"text/plain"})
    public String robots() {
        TemplateDto template = templateService.getTemplate(TemplateKeyEnum.TM_ROBOTS);
        return template.getRefValue();
    }

    private String getSitemap(TemplateKeyEnum key) {
        TemplateDto template = templateService.getTemplate(key);
        Map<String, Object> map = new HashMap<>();
        map.put("articleTypeList", typeService.listAll());
        map.put("articleTagsList", tagsService.listAll());
        map.put("articleList", articleService.listAll());
        map.put("config", configService.get());
        return FreeMarkerUtil.template2String(template.getRefValue(), map, true);
    }
}
