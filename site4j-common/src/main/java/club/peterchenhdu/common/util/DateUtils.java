/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.common.util;

import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * DateUtils
 *
 * @author PiChen
 * @since 2018/10/20
 */
@Slf4j
public class DateUtils {

    /**
     * yyyy-MM-dd HH:mm:ss
     */
    public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

    /**
     * yyyyMMddHHmmssSSS
     */
    public static final String YYYY_MM_DD_HH_MM_SS_SSS = "yyyyMMddHHmmssSSS";

    /**
     * 字符串日期转换为Date日期
     *
     * @param dateStr 字符串日期
     * @param pattern 参考DateConst.java
     * @return Date类型的日期
     */
    public static Date str2Date(String dateStr, String pattern) {
        Date resultDate = null;
        if (dateStr != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            try {
                resultDate = sdf.parse(dateStr);
            } catch (ParseException e) {
                log.error("日期转换异常", e);
            }
        }
        return resultDate;
    }

    /**
     * Date日期转换为字符串日期
     *
     * @param date    Date日期
     * @param pattern 参考DateConst.java
     * @return 字符串类型的日期
     */
    public static String date2Str(LocalDateTime date, String pattern) {
        if (date == null) {
            throw new RuntimeException("无效的时间");
        }

        DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);

        return df.format(date);
    }

    /**
     * 获取两个日期间隔的天数
     *
     * @param before 较前的时间
     * @param after  较后的时间
     * @return 返回两者相差的天数
     */
    public static long getGapDay(LocalDateTime before, LocalDateTime after) {
        Duration d = Duration.between(before, after);
        return d.toDays();
    }
}
