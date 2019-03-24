/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.common.util;

import java.util.UUID;

/**
 * @author PiChen
 * @since 2019/2/4
 */
public class UuidUtils {

    public static String getUuid() {
       return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
