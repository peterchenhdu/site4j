/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config.freemarker.template;

import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.enums.ModuleEnum;
import com.github.peterchenhdu.site4j.common.enums.OperationEnum;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTagsService;
import com.github.peterchenhdu.site4j.biz.service.articlemgt.BizTypeService;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysResourcesService;
import com.github.peterchenhdu.site4j.biz.service.privilegemgt.SysRoleService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.BizCommentService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysConfigService;
import com.github.peterchenhdu.site4j.biz.service.sitemgt.SysLinkService;
import com.github.peterchenhdu.site4j.util.SessionUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 自定义的freemarker标签
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Component
public class CustomTagDirective implements TemplateDirectiveModel {
    private static final String METHOD_KEY = "method";
    @Autowired
    private BizTypeService bizTypeService;
    @Autowired
    private BizCommentService commentService;
    @Autowired
    private BizTagsService bizTagsService;
    @Autowired
    private SysResourcesService resourcesService;
    @Autowired
    private SysConfigService configService;
    @Autowired
    private SysLinkService sysLinkService;
    @Autowired
    private SysRoleService sysRoleService;

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);

        if (map.containsKey(METHOD_KEY)) {
            String method = map.get(METHOD_KEY).toString();
            int pageSize = map.containsKey("pageSize") ? Integer.parseInt(map.get("pageSize").toString()) : 10;

            switch (method) {
                case "types":
                    environment.setVariable("types", builder.build().wrap(bizTypeService.listTypeForMenu()));
                    break;
                case "roles":
                    environment.setVariable("roles", builder.build().wrap(sysRoleService.selectList(new EntityWrapper<>())));
                    break;
                case "module":
                    environment.setVariable("module", builder.build().wrap(ModuleEnum.toList()));
                    break;
                case "operation":
                    environment.setVariable("operation", builder.build().wrap(OperationEnum.toList()));
                    break;
                case "tagsList":
                    // 所有标签
                    environment.setVariable("tagsList", builder.build().wrap(bizTagsService.listAll()));
                    break;
                case "recentComments":
                    // 近期评论
                    environment.setVariable("recentComments", builder.build().wrap(commentService.listRecentComment(pageSize)));
                    break;
                case "linkList":
                    // 站点属性
                    environment.setVariable("linkList", builder.build().wrap(sysLinkService.listOfIndex()));
                    break;
                case "siteInfo":
                    // 站点属性
                    environment.setVariable("siteInfo", builder.build().wrap(configService.getSiteInfo()));
                    break;
                case "menus":
                    String userId = null;
                    UserDto user = SessionUtil.getUser();
                    if (map.containsKey("userId") && user != null) {
                        String userIdStr = map.get("userId").toString();
                        if (StringUtils.isEmpty(userIdStr)) {
                            return;
                        }
                        userId = userIdStr;
                    }
                    Map<String, Object> params = new HashMap<>(2);
                    params.put("type", "menu");
                    params.put("userId", user!=null&&"root".equals(user.getUsername()) ? null:userId);
                    environment.setVariable("menus", builder.build().wrap(resourcesService.listUserResources(params)));
                    break;
                default:
                    break;
            }
        }
        templateDirectiveBody.render(environment.getOut());
    }
}
