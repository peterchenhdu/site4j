
package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.ObjectUtils;

import java.util.Locale;

public class I18nUtils {

    private static Locale DEFAULT_LOCALE = Locale.SIMPLIFIED_CHINESE;

    private static Locale getDefaultLocale() {
        Locale locale = ObjectUtils.isNotEmpty(RequestHolder.getRequest()) ? RequestHolder.getRequest().getLocale() : null;
        return ObjectUtils.isNotEmpty(locale) ? locale : DEFAULT_LOCALE;
    }

    public static String getMessage(String key, Object[] params, Locale locale) {
        return SpringContextHolder.getApplicationContext().getMessage(key,
                ObjectUtils.isEmpty(params) ? new Object[]{} : params,
                ObjectUtils.isEmpty(locale) ? getDefaultLocale() : locale);
    }

}