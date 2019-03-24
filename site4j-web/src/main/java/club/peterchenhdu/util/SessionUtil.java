/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.util;

import club.peterchenhdu.biz.dto.UserDto;
import club.peterchenhdu.common.constant.SessionConst;
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
        Object obj = RequestHolder.getSession(SessionConst.USER_SESSION_KEY);
        return (UserDto) obj;
    }

    /**
     * 添加session
     *
     * @param user
     */
    public static void setUser(UserDto user) {
        RequestHolder.setSession(SessionConst.USER_SESSION_KEY, user);
    }

    /**
     * 删除session信息
     */
    public static void removeUser() {
        RequestHolder.removeSession(SessionConst.USER_SESSION_KEY);
    }

    /**
     * 获取session中的Token信息
     *
     * @return String
     */
    public static String getToken(String key) {
        return (String) RequestHolder.getSession(key);
    }

    /**
     * 添加Token
     */
    public static void setToken(String key) {
        RequestHolder.setSession(key, UUID.randomUUID().toString());
    }

    /**
     * 删除Token信息
     */
    public static void removeToken(String key) {
        RequestHolder.removeSession(key);
    }

    /**
     * 获取验证码
     */
    public static String getVCode() {
        return (String) RequestHolder.getSession(SessionConst.V_CODE_SESSION_KEY);
    }

    /**
     * 保存验证码
     */
    public static void setVCode(String vCode) {
        RequestHolder.setSession(SessionConst.V_CODE_SESSION_KEY, vCode);
    }

    /**
     * 保存验证码
     */
    public static void removeVCode() {
        RequestHolder.removeSession(SessionConst.V_CODE_SESSION_KEY);
    }

    /**
     * 删除所有的session信息
     */
    public static void removeAllSession() {
        String[] keys = RequestHolder.getSessionKeys();
        if (keys.length > 0) {
            for (String key : keys) {
                RequestHolder.removeSession(key);
            }
        }
    }
}
