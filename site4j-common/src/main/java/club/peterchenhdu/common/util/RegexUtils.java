/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.util;

import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * RegexUtils
 *
 * @author PiChen
 * @since 2018/10/21
 */
public class RegexUtils {

    /**
     * @param regex 正则表达式字符串
     * @param str   要匹配的字符串
     * @return List;
     */
    public static List<String> getMatchList(String str, String regex) {
        if (null == str) {
            return null;
        }
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(str);
        List<String> list = new LinkedList<>();
        while (matcher.find()) {
            list.add(matcher.group());
        }
        return list;
    }

    public static boolean match(String str, String regex) {
        if (null == str) {
            return false;
        }
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(str);
        return matcher.find();
    }
}  

