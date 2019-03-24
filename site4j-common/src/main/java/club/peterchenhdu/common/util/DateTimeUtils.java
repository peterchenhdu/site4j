/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.common.util;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;

/**
 * @author PiChen
 * @since 2019/2/5
 */
public class DateTimeUtils {

    public static long toTimestamp(LocalDateTime dateTime) {
        return dateTime.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
    }

    public static LocalDateTime toLocalDateTime(long timestamp) {
        Instant instant = Instant.ofEpochMilli(timestamp);
        return LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
    }

    public static void main(String[] args) {
        System.out.println(toTimestamp(toLocalDateTime(1549366364450L)));

    }
}
