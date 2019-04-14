/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.Md5Utils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.Test;

/**
 * Md5UtilsTest
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
public class Md5UtilsTest {
    @Test
    public void md5() throws Exception {
        String value = Md5Utils.md5("helloJava", "salt");
        log.info(value);
        Assert.assertEquals("F4D7581151C5D48126B3CE55006751E3", value);
    }

    @Test
    public void md51() throws Exception {
        String value = Md5Utils.md5("helloJava123");
        log.info(value);
        Assert.assertEquals("B97F0A2A4CC9FDD95639906CE40D62AF", value);
    }

}