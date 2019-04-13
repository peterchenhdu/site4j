/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.enums;

/**
 * 模板枚举类，key对应模板文件名
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public enum TemplateKeyEnum {
    SITE_MAP_XML,
    SITE_MAP_TXT,
    SITE_MAP_HTML,
    ROBOTS,
    LINKS,
    LINKS_TO_ADMIN,
    EMAIL,
    COMMENT_AUDIT,
    COMMENT_REPLY,
    NEW_COMMENT;

    @Override
    public String toString() {
        return super.toString().toLowerCase();
    }
}
