/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.util;

import club.peterchenhdu.common.util.IpUtils;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;

/**
 * @author PiChen
 * @since 2018/10/21
 */
@Slf4j
public class IpUtilsTest {
    @Test
    public void getRealIp() throws Exception {
        String ip = IpUtils.getRealIp(new MockHttpServletRequest());
        log.info(ip);
    }

}