/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.util;

import java.util.UUID;

/**
 * UUID处理工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class UuidUtils {

    public static String getUuid() {
       return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
