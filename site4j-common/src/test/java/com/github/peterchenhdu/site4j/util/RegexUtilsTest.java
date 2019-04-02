/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.util;

import com.github.peterchenhdu.site4j.common.util.RegexUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.util.List;

/**
 * @author PiChen
 * @since 2018/10/21
 */
@Slf4j
public class RegexUtilsTest {
    @Test
    public void match() throws Exception {
        List<String> list = RegexUtils.getMatchList("ss Chapter 12 sad 1 Chapter 13", "[0-9]{2}");
        log.info(list.toString());
    }

    @Test
    public void checkByRegex() throws Exception {
        log.info(RegexUtils.match("Chapter 12", "^Chapter [0-9]{1,2}$") + "");
    }

}