/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.enums.TemplateKeyEnum;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.apache.commons.io.FileUtils;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Freemarker模板操作工具类
 *
 * @author chenpi
 * @version 1.0
 * @since 2018/4/18 11:48
 * @since 1.0
 */

public class FreeMarkerUtil {

    private static final String LT = "<";
    private static final String LT_CHAR = "&lt;";

    private static final String GT = ">";
    private static final String GT_CHAR = "&gt;";

    private static final String AMP = "&";
    private static final String AMP_CHAR = "&amp;";

    private static final String APOS = "'";
    private static final String APOS_CHAR = "&apos;";

    private static final String QUOT = "\"";
    private static final String QUOT_CHAR = "&quot;";


    //不需要重复创建Configuration 实例； 它的代价很高，Configuration实例就是应用级别的单例。
    private static final Configuration configuration = new Configuration(Configuration.VERSION_2_3_28);

    /**
     * Template to String Method Note
     *
     * @param templateKeyEnum templateKeyEnum
     * @param map             template data map
     * @return String
     */
    public static String template2String(TemplateKeyEnum templateKeyEnum, final Map<String, Object> map, boolean isNeedEscape) {

        String key = templateKeyEnum.toString();
        String templateContent;
        try {
        File file =ResourceUtils.getFile("classpath:templates/sysconfig/"+key+".ftl");




            templateContent = FileUtils.readFileToString(file, StandardCharsets.UTF_8);
        } catch (IOException e) {
            LogUtils.exception(e);
            return null;
        }


        if (map == null) {
            return templateContent;
        }

        Map<String, Object> newMap = isNeedEscape ? map.keySet().stream().collect(Collectors.toMap(k -> k, k -> {
            Object v = map.get(k);
            return (v instanceof String && isNeedEscape) ? escapeString(v.toString()) : v;
        })) : map;


        try {
            Template t = new Template(null, new StringReader(templateContent), configuration);
            return FreeMarkerTemplateUtils.processTemplateIntoString(t, newMap);
        } catch (IOException | TemplateException e) {
            LogUtils.exception(e);
        } finally {
            newMap.clear();
        }
        return null;
    }

    public static String escapeString(String str) {
        StringBuilder sb = new StringBuilder();
        for (char c : str.toCharArray()) {
            switch (String.valueOf(c)) {
                case LT:
                    sb.append(LT_CHAR);
                    break;
                case GT:
                    sb.append(GT_CHAR);
                    break;
                case AMP:
                    sb.append(AMP_CHAR);
                    break;
                case APOS:
                    sb.append(APOS_CHAR);
                    break;
                case QUOT:
                    sb.append(QUOT_CHAR);
                    break;
                default:
                    sb.append(c);
                    break;
            }
        }
        return sb.toString();
    }

}
