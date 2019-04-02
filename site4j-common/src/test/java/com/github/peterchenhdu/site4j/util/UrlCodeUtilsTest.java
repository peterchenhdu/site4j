/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.UrlCodeUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

/**
 * @author PiChen
 * @since 2018/10/21
 */
@Slf4j
public class UrlCodeUtilsTest {
    @Test
    public void encode() throws Exception {
       String url = UrlCodeUtils.encode("http://www.ello.com?ss=123呵呵");
       log.info(url);
    }

    @Test
    public void decode() throws Exception {
        String url = UrlCodeUtils.decode("http%3A%2F%2Fwww.ello.com%3Fss%3D123%E5%91%B5%E5%91%B5");
        log.info(url);
    }

}