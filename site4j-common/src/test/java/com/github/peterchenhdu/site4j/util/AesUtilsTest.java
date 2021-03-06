/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.AesUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Slf4j
public class AesUtilsTest {
    @Test
    public void encrypt() throws Exception {
        log.info(AesUtils.encrypt("123456","HelloJava"));
    }

    @Test
    public void decrypt() throws Exception {
        log.info(AesUtils.decrypt("123456","GDij1W37eg6N6Ei80Cub4w=="));
    }

}