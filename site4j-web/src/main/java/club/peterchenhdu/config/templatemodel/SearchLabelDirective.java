/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.config.templatemodel;

import club.peterchenhdu.biz.service.articlemgt.ISearchCountService;
import club.peterchenhdu.biz.service.articlemgt.ISearchHistoryService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * @author PiChen
 * @since 2018/10/27
 */
@Component
public class SearchLabelDirective implements TemplateDirectiveModel {
    private static final String METHOD_KEY = "method";
    private static final Integer DEFAULT_PAGE_SIZE = 10;

    @Autowired
    private ISearchHistoryService searchHistoryService;
    @Autowired
    private ISearchCountService searchCountService;


    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        if (map.containsKey(METHOD_KEY)) {

            //获取参数
            int pageSize = DEFAULT_PAGE_SIZE;
            if (map.containsKey("pageSize")) {
                pageSize = Integer.parseInt(map.get("pageSize").toString());
            }


            //调用方法执行
            String method = map.get(METHOD_KEY).toString();
            switch (method) {
                case "recentSearch":
                    // 近期文章
                    environment.setVariable("recentSearch", builder.build().wrap(searchHistoryService.listRecent(pageSize)));
                    break;
                case "hotSearch":
                    // 热门搜索
                    environment.setVariable("hotSearch", builder.build().wrap(searchCountService.listHot(pageSize)));
                    break;

                default:
                    break;
            }
        }
        templateDirectiveBody.render(environment.getOut());
    }


}
