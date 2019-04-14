/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.util.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class HtmlUtil {
    /**
     * 获取首个Element信息
     *
     * @param htmlDocument
     * @param styleClassName
     * @return
     */
    public static Element getFirstElementByClass(Document htmlDocument, String styleClassName) {
        if (htmlDocument == null || styleClassName == null || styleClassName.equals("")) {
            return null;
        }
        Elements elements = htmlDocument.getElementsByClass(styleClassName);
        if (elements == null || elements.size() <= 0) {
            return null;
        }
        return elements.get(0);
    }

    public static Element getFirstElementByClass(Element element, String styleClassName) {
        if (element == null || styleClassName == null || styleClassName.equals("")) {
            return null;
        }
        Elements elements = element.getElementsByClass(styleClassName);
        if (elements == null || elements.size() <= 0) {
            return null;
        }
        return elements.get(0);
    }

    /**
     * 获取Elements
     *
     * @param htmlDocument
     * @param styleClassName
     * @return
     */
    public static Elements getElementsByClass(Document htmlDocument, String styleClassName) {
        if (htmlDocument == null || styleClassName == null || styleClassName.equals("")) {
            return null;
        }
        return htmlDocument.getElementsByClass(styleClassName);
    }

    /**
     * 获取首个Element
     *
     * @param htmlDocument
     * @param tag
     * @return
     */
    public static Element getFirstElementByTag(Document htmlDocument, String tag) {
        if (htmlDocument == null || tag == null || tag.equals("")) {
            return null;
        }
        Elements elements = htmlDocument.getElementsByTag(tag);
        if (elements == null || elements.size() <= 0) {
            return null;
        }
        return elements.get(0);
    }

    public static Element getFirstElementByTag(Element element, String tag) {
        if (element == null || tag == null || tag.equals("")) {
            return null;
        }
        Elements elements = element.getElementsByTag(tag);
        if (elements == null || elements.size() <= 0) {
            return null;
        }
        return elements.get(0);
    }

    public static Elements getElementsByTag(Document htmlDocument, String tag) {
        if (htmlDocument == null || tag == null || tag.equals("")) {
            return null;
        }
        return htmlDocument.getElementsByTag(tag);
    }

    public static Elements getElementsByTag(Element element, String tag) {
        if (element == null || tag == null || tag.equals("")) {
            return null;
        }
        return element.getElementsByTag(tag);
    }

    /**
     * 获取Element
     *
     * @param htmlDocument
     * @param id
     * @return
     */
    public static Element getElementById(Document htmlDocument, String id) {
        if (htmlDocument == null || id == null || id.equals("")) {
            return null;
        }
        return htmlDocument.getElementById(id);
    }

    /**
     * 替换所有标签
     *
     * @param content
     * @return
     */
    public static String html2Text(String content) {
        if (StringUtils.isEmpty(content)) {
            return null;
        }
        // 定义HTML标签的正则表达式
        String regEx_html = "<[^>]+>";
        content = content.replaceAll(regEx_html, "").replaceAll(" ", "");
        content = content.replaceAll("&quot;", "\"")
                .replaceAll("&nbsp;", "")
                .replaceAll("&amp;", "&")
                .replaceAll("\n", " ")
                .replaceAll("&#39;", "\'")
                .replaceAll("&lt;", "<")
                .replaceAll("&gt;", ">")
                .replaceAll("[ \\f\\t\\v]{2,}", "\t");

        String regEx = "<.+?>";
        Pattern pattern = Pattern.compile(regEx);
        Matcher matcher = pattern.matcher(content);
        content = matcher.replaceAll("");
        return content.trim();
    }
}
