/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.util;

import club.peterchenhdu.common.util.DateUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * DateUtilsTest
 *
 * @author PiChen
 * @since 2018/10/20
 */
@Slf4j
public class DateUtilsTest {
    @Test
    public void str2Date() throws Exception {
        Date date = DateUtils.str2Date("2018-12-12 00:12:12", DateUtils.YYYY_MM_DD_HH_MM_SS);
        log.info(date.toString());
    }

    @Test
    public void date2Str() throws Exception {
        String date = DateUtils.date2Str(LocalDateTime.now(), DateUtils.YYYY_MM_DD_HH_MM_SS);
        log.info(date);
    }

}