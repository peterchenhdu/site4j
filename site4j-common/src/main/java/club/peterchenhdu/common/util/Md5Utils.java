/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.util;

import lombok.extern.slf4j.Slf4j;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Md5Utils
 *
 * @author PiChen
 * @since 2018/10/20
 */
@Slf4j
public class Md5Utils {
    private static final char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    /**
     * md5加密，带盐值（32位 大写）
     *
     * @param param param
     * @param salt  salt
     * @return String
     */
    public static String md5(String param, String salt) {
        return md5(param + salt);
    }

    /**
     * md5加密（32位 大写）
     *
     * @param s 字符串
     * @return String
     */
    public static String md5(String s) {
        try {
            byte[] btInput = s.getBytes();
            MessageDigest mdInst = MessageDigest.getInstance("md5");
            mdInst.update(btInput);
            byte[] md = mdInst.digest();
            int j = md.length;
            char[] str = new char[j * 2];
            int k = 0;
            for (byte byte0 : md) {
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (NoSuchAlgorithmException e) {
            LogUtils.exception(e);
            throw new RuntimeException("MD5失败");
        }
    }
}
