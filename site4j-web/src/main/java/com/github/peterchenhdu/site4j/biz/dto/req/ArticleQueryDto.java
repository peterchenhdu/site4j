/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;
import com.github.peterchenhdu.site4j.biz.dto.ArticleDto;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ArticleQueryDto extends BasePagingQueryDto {
    private ArticleDto article;
    private List<String> typeIdList;
    private String tagId;
    private Integer status;
    private Boolean top;
    private Boolean recommended;
    private Boolean original;
    private Boolean random;
    private List<String> tagIds;
    private String keywords;
}

