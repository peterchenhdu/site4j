/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util.web;

import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 获取HttpServletRequest相关
 * <p>
 * Created by chenpi on 2018/10/21.
 */
public class WebUtils {

    /**
     * 获取request
     *
     * @return HttpServletRequest
     */
    public static HttpServletRequest getRequest() {
        LogUtils.debug("getRequest -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (ObjectUtils.isNotEmpty(requestAttributes)) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            return servletRequestAttributes.getRequest();
        } else {
            LogUtils.warn("HttpServletRequest is null");
            return null;
        }

    }

    /**
     * 获取Response
     *
     * @return HttpServletRequest
     */
    public static HttpServletResponse getResponse() {
        LogUtils.debug("getResponse -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (ObjectUtils.isNotEmpty(requestAttributes)) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            return servletRequestAttributes.getResponse();
        } else {
            LogUtils.warn("HttpServletResponse is null");
            return null;
        }

    }

    /**
     * 获取session
     *
     * @return HttpSession
     */
    public static HttpSession getSession() {
        LogUtils.debug("getSession -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());
        HttpServletRequest httpServletRequest = getRequest();
        if (ObjectUtils.isNotEmpty(httpServletRequest)) {
            return httpServletRequest.getSession();
        } else {
            LogUtils.warn("HttpSession is null");
            return null;
        }

    }

    /**
     * 获取session的Attribute
     *
     * @param name session的key
     * @return Object
     */
    public static Object getSession(String name) {
        LogUtils.info("getSession -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (ObjectUtils.isNotEmpty(requestAttributes)) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            return servletRequestAttributes.getAttribute(name, RequestAttributes.SCOPE_SESSION);
        } else {
            LogUtils.warn("getSession {} is null", name);
            return null;
        }

    }

    /**
     * 添加session
     *
     * @param name  name
     * @param value value
     */
    public static void setSession(String name, Object value) {
        LogUtils.info("setSession -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (ObjectUtils.isNotEmpty(requestAttributes)) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            servletRequestAttributes.setAttribute(name, value, RequestAttributes.SCOPE_SESSION);
        } else {
            LogUtils.warn("requestAttributes is null, setSession key:{}, value:{} fail", name, value);
        }
    }

    /**
     * 清除指定session
     *
     * @param name name
     */
    public static void removeSession(String name) {
        LogUtils.debug("removeSession -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());

        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (ObjectUtils.isNotEmpty(requestAttributes)) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            servletRequestAttributes.removeAttribute(name, RequestAttributes.SCOPE_SESSION);
        } else {
            LogUtils.warn("requestAttributes is null, setSession key:{} fail", name);
        }

    }

    /**
     * 获取所有session key
     *
     * @return String[]
     */
    public static String[] getSessionKeys() {
        LogUtils.debug("getSessionKeys -- Thread id :{}, name : {}", Thread.currentThread().getId(), Thread.currentThread().getName());

        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        if (ObjectUtils.isNotEmpty(requestAttributes)) {
            ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) requestAttributes;
            return servletRequestAttributes.getAttributeNames(RequestAttributes.SCOPE_SESSION);
        } else {
            LogUtils.warn("requestAttributes is null, getSessionKeys fail");
            return null;
        }

    }
}
