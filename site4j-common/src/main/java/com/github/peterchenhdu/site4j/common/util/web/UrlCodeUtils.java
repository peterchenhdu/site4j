/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util.web;

import com.github.peterchenhdu.site4j.common.util.ObjectUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * URL编码工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class UrlCodeUtils {

    private static final String URL_ENCODE = "UTF-8";


    public static String encode(String param) {
        if (ObjectUtils.isEmpty(param)) {
            return param;
        }

        try {
            return URLEncoder.encode(param, URL_ENCODE);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("URL编码发生异常");
        }
    }


    public static String decode(String param) {
        if (ObjectUtils.isEmpty(param)) {
            return param;
        }

        try {
            return URLDecoder.decode(param, URL_ENCODE);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("URL解码发生异常");
        }
    }
}

