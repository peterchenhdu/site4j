/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util;

import javax.servlet.http.HttpServletRequest;

/**
 * IpUtils
 *
 * @author PiChen
 * @since 2018/10/21
 */
public class IpUtils {

    private static final String UNKNOWN_IP = "unknown";

    public static String getRealIp(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (isIpValid(ip)) {
            return ip;
        }

        ip = request.getHeader("Proxy-Client-IP");
        if (isIpValid(ip)) {
            return ip;
        }

        ip = request.getHeader("WL-Proxy-Client-IP");
        if (isIpValid(ip)) {
            return ip;
        }

        ip = request.getRemoteAddr();
        if (isIpValid(ip)) {
            return ip;
        }

        return UNKNOWN_IP;
    }


    private static boolean isIpValid(String ip) {
        return ObjectUtils.isNotEmpty(ip) && !UNKNOWN_IP.equalsIgnoreCase(ip);
    }
}