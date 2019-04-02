/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config.freemarker.template;

import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import com.github.peterchenhdu.site4j.biz.dto.req.ArticleConditionVO;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import com.github.peterchenhdu.site4j.common.enums.ArticleStatusEnum;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizArticleService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * 文章相关的自定义标签
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Component
public class ArticleTagDirective implements TemplateDirectiveModel {
    private static final String METHOD_KEY = "method";

    @Autowired
    private BizArticleService articleService;

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        if (map.containsKey(METHOD_KEY)) {
            String method = map.get(METHOD_KEY).toString();
            int pageSize = 10;
            if (map.containsKey("pageSize")) {
                String pageSizeStr = map.get("pageSize").toString();
                pageSize = Integer.parseInt(pageSizeStr);
            }
            String typeId = "";
            if (map.containsKey("typeId")) {
                typeId = map.get("typeId").toString();
            }

            switch (method) {
                case "recentArticles":
                    // 近期文章
                    environment.setVariable("recentArticles", builder.build().wrap(articleService.listRecent(pageSize)));
                    break;
                case "recommendedList":
                    // 站长推荐
                    environment.setVariable("recommendedList", builder.build().wrap(articleService.listRecommended(pageSize)));
                    break;
                case "randomList":
                    // 随机文章
                    environment.setVariable("randomList", builder.build().wrap(articleService.listRandom(pageSize)));
                    break;
                case "hotList":
                    // 热门文章
                    environment.setVariable("hotList", builder.build().wrap(articleService.listHotArticle(pageSize)));
                    break;
                case "typeList":
                    // 按文章分类查询
                    ArticleConditionVO vo = new ArticleConditionVO();
                    vo.setTypeId(typeId);
                    // 已发布状态
                    vo.setStatus(ArticleStatusEnum.PUBLISHED.getCode());
                    vo.setPageSize(pageSize);
                    PageInfo<ArticleDto> pageInfo = articleService.findPageBreakByCondition(vo);
                    environment.setVariable("typeList", builder.build().wrap(null == pageInfo ? null : pageInfo.getList()));
                    break;
                default:
                    break;
            }
        }
        templateDirectiveBody.render(environment.getOut());
    }
}
