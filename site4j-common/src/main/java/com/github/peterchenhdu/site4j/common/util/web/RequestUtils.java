/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util.web;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class RequestUtils {

    public static String getParameters() {
        HttpServletRequest request = WebUtils.getRequest();
        Enumeration<String> paraNames = request.getParameterNames();
        if (paraNames == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        while (paraNames.hasMoreElements()) {
            String paraName = paraNames.nextElement();
            sb.append("&").append(paraName).append("=").append(request.getParameter(paraName));
        }
        return sb.toString();
    }

    public static String getHeader(String headerName) {
        return WebUtils.getRequest().getHeader(headerName);
    }

    public static String getReferer() {
        return getHeader("Referer");
    }

    public static String getUa() {
        return getHeader("User-Agent");
    }

    public static String getIp() {
        HttpServletRequest request = WebUtils.getRequest();
        return IpUtils.getRealIp(request);
    }

    public static String getRequestUrl() {
        HttpServletRequest request = WebUtils.getRequest();
        return request.getRequestURL().toString();
    }

    public static String getRequestUri() {
        HttpServletRequest request = WebUtils.getRequest();
        return request.getRequestURI();
    }

    public static String getMethod() {
        HttpServletRequest request = WebUtils.getRequest();
        return request.getMethod();
    }

}
