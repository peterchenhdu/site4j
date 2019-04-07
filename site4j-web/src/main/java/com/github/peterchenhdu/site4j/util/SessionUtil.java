/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.biz.dto.UserDto;
import com.github.peterchenhdu.site4j.common.util.web.WebUtils;
import com.github.peterchenhdu.site4j.constant.SessionConst;
import lombok.extern.slf4j.Slf4j;

import java.util.UUID;

/**
 * Session工具类
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
 */
@Slf4j
public class SessionUtil {

    /**
     * 获取session中的用户信息
     *
     * @return User
     */
    public static UserDto getUser() {
        Object obj = WebUtils.getSession(SessionConst.USER_SESSION_KEY);
        return (UserDto) obj;
    }

    /**
     * 添加session
     *
     * @param user
     */
    public static void setUser(UserDto user) {
        WebUtils.setSession(SessionConst.USER_SESSION_KEY, user);
    }

    /**
     * 删除session信息
     */
    public static void removeUser() {
        WebUtils.removeSession(SessionConst.USER_SESSION_KEY);
    }

    /**
     * 获取session中的Token信息
     *
     * @return String
     */
    public static String getToken(String key) {
        return (String) WebUtils.getSession(key);
    }

    /**
     * 添加Token
     */
    public static void setToken(String key) {
        WebUtils.setSession(key, UUID.randomUUID().toString());
    }

    /**
     * 删除Token信息
     */
    public static void removeToken(String key) {
        WebUtils.removeSession(key);
    }

    /**
     * 获取验证码
     */
    public static String getVCode() {
        return (String) WebUtils.getSession(SessionConst.V_CODE_SESSION_KEY);
    }

    /**
     * 保存验证码
     */
    public static void setVCode(String vCode) {
        WebUtils.setSession(SessionConst.V_CODE_SESSION_KEY, vCode);
    }

    /**
     * 保存验证码
     */
    public static void removeVCode() {
        WebUtils.removeSession(SessionConst.V_CODE_SESSION_KEY);
    }

    /**
     * 删除所有的session信息
     */
    public static void removeAllSession() {
        String[] keys = WebUtils.getSessionKeys();
        if (keys.length > 0) {
            for (String key : keys) {
                WebUtils.removeSession(key);
            }
        }
    }
}
