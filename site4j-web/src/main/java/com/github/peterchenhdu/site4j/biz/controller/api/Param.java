/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.controller.api;

import java.time.LocalDateTime;
import java.time.LocalTime;

/**
 * Created by PiChen on 2019/5/30.
 */
public class Param {
    private LocalDateTime time;
    private LocalTime localtime;

    public LocalTime getLocaltime() {
        return localtime;
    }

    public void setLocaltime(LocalTime localtime) {
        this.localtime = localtime;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
