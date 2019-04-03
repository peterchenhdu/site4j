/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 正则表达式处理工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class RegexUtils {

    /**
     * @param regex 正则表达式字符串
     * @param str   要匹配的字符串
     * @return List;
     */
    public static List<String> getMatchList(String str, String regex) {
        if (ObjectUtils.isEmpty(str)) {
            return Collections.emptyList();
        }
        Matcher matcher = Pattern.compile(regex).matcher(str);
        List<String> list = new LinkedList<>();
        while (matcher.find()) {
            list.add(matcher.group());
        }
        return list;
    }

    public static boolean match(String str, String regex) {
        if (ObjectUtils.isEmpty(str)) {
            return false;
        }
        return Pattern.compile(regex).matcher(str).find();
    }

}  

