/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto;

import com.github.peterchenhdu.site4j.biz.entity.BizArticle;
import com.github.peterchenhdu.site4j.biz.entity.BizComment;
import com.github.peterchenhdu.site4j.enums.CommentStatusEnum;
import com.github.peterchenhdu.site4j.util.HtmlUtil;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class CommentDto extends BizComment {

    public CommentDto() {

    }



}

