/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import lombok.Data;

/**
 * 系统通知详情，用于页面传输
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
public class SysNoticeDto {
    private String title;
    private String content;
}
