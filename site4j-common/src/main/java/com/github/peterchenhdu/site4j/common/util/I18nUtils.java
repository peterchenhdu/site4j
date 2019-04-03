
/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.util;

import com.github.peterchenhdu.site4j.common.constant.CommonConstants;

import java.util.Locale;

public class I18nUtils {


    private static Locale DEFAULT_LOCALE = Locale.SIMPLIFIED_CHINESE;

    private static Locale getDefaultLocale() {
        Locale locale = ObjectUtils.isNotEmpty(RequestHolder.getRequest()) ? RequestHolder.getRequest().getLocale() : null;
        return ObjectUtils.isNotEmpty(locale) ? locale : DEFAULT_LOCALE;
    }

    public static String getMessage(String key, Object[] params, Locale locale) {
        try {
            return SpringContextHolder.getApplicationContext().getMessage(key,
                    ObjectUtils.isEmpty(params) ? CommonConstants.EMPTY_OBJECT_ARRAY : params,
                    ObjectUtils.isEmpty(locale) ? getDefaultLocale() : locale);
        } catch (Exception e) {
            LogUtils.exception(e);
            return CommonConstants.EMPTY_STRING;
        }

    }

    public static String getMessage(String key, Object[] params) {
        return getMessage(key, params, null);
    }

    public static String getMessage(String key) {
        return getMessage(key, null, null);
    }
}