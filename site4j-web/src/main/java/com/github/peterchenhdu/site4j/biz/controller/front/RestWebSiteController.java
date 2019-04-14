/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.front;

import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTagsService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTypeService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;
import com.github.peterchenhdu.site4j.util.FreeMarkerUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * 站点相关的接口类，主要为sitemap和robots的生成
 * <p>
 * Created by chenpi on 2019/02/05.
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
    private SysConfigService configService;

    @GetMapping(value = "/sitemap.xml", produces = {"application/xml"})
    public String sitemapXml() {
        return getSitemap(TemplateKeyEnum.SITE_MAP_XML);
    }

    @GetMapping(value = "/sitemap.txt", produces = {"text/plain"})
    public String sitemapTxt() {
        return getSitemap(TemplateKeyEnum.SITE_MAP_TXT);
    }

    @GetMapping(value = "/sitemap.html", produces = {"text/html"})
    public String sitemapHtml() {
        return getSitemap(TemplateKeyEnum.SITE_MAP_HTML);
    }

    @GetMapping(value = "/robots.txt", produces = {"text/plain"})
    public String robots() {
        return FreeMarkerUtil.template2String(TemplateKeyEnum.ROBOTS, null, true);
    }

    private String getSitemap(TemplateKeyEnum key) {
        Map<String, Object> map = new HashMap<>();
        map.put("articleTypeList", typeService.listAll());
        map.put("articleTagsList", tagsService.listAll());
        map.put("articleList", articleService.listAll());
        map.put("config", configService.get());
        return FreeMarkerUtil.template2String(key, map, true);
    }
}
