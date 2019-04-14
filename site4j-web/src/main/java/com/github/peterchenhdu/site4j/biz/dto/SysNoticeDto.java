/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import lombok.Data;

/**
 * 系统通知详情，用于页面传输
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
public class SysNoticeDto {
    private String title;
    private String content;
}
