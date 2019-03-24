/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.util;

import org.springframework.util.StringUtils;

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
        if (isValidIp(ip)) {
            return ip;
        } else {
            ip = request.getHeader("Proxy-Client-IP");
        }

        if (isValidIp(ip)) {
            return ip;
        } else {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (isValidIp(ip)) {
            return ip;
        } else {
            ip = request.getRemoteAddr();
        }

        if (isValidIp(ip)) {
            return ip;
        } else {
            return UNKNOWN_IP;
        }
    }


    private static boolean isValidIp(String ip) {
        return !StringUtils.isEmpty(ip) && !UNKNOWN_IP.equalsIgnoreCase(ip);
    }
}