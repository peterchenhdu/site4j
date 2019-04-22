/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.enums.ArticleStatusEnum;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class ArticleDto extends BizArticle{
    public ArticleStatusEnum getStatusEnum() {
        return ArticleStatusEnum.get(this.getStatus());
    }
}

