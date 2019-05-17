/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.enums;

/**
 * 文章编辑器类型
 * <p>
 * Created by PiChen on 2019/5/17.
 */
public enum ArticleFormatter {
    MARK_DOWN("Markdown", "Markdown"),
    WANG_EDITOR("WangEditor", "WangEditor");
    private String key;
    private String description;

    ArticleFormatter(String key, String description) {
        this.key = key;
        this.description = description;
    }

    public String getKey() {
        return key;
    }

    public String getDescription() {
        return description;
    }


}
