/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.AesUtils;
import com.github.peterchenhdu.site4j.common.util.Md5Utils;
import com.github.peterchenhdu.site4j.constant.SysConstants;

/**
 * 密码工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class PasswordUtils {

    /**
     * AES 加密
     *
     * @param password 未加密的密码
     * @param salt     盐值，默认使用用户名就可
     * @return 加密后的内容
     */
    public static String encrypt(String password, String salt) {

        return AesUtils.encrypt(Md5Utils.md5(salt + SysConstants.SECURITY_KEY), password);


    }

    /**
     * AES 解密
     *
     * @param encryptPassword 加密后的密码
     * @param salt            盐值，默认使用用户名就可
     * @return 解密后的内容
     */
    public static String decrypt(String encryptPassword, String salt) {
        return AesUtils.decrypt(Md5Utils.md5(salt + SysConstants.SECURITY_KEY), encryptPassword);
    }
}
