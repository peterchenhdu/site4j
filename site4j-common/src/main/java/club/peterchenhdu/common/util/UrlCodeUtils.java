/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * UrlCodeUtils
 *
 * @author PiChen
 * @since 2018/10/21
 */
@Slf4j
public class UrlCodeUtils {

    private static final String URL_ENCODE = "UTF-8";

    private UrlCodeUtils() {
    }


    public static String encode(String param) {
        String result = null;
        if (!StringUtils.isEmpty(param)) {
            try {
                result = URLEncoder.encode(param, URL_ENCODE);
            } catch (UnsupportedEncodingException e) {
                log.error("url编码发生异常", e);
            }
        }
        return result;
    }


    public static String decode(String param) {
        String result = null;
        if (!StringUtils.isEmpty(param)) {
            try {
                result = URLDecoder.decode(param, URL_ENCODE);
            } catch (UnsupportedEncodingException e) {
                log.error("url编码发生异常", e);
            }
        }
        return result;
    }
}
