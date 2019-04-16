/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.dto.req;

import com.github.peterchenhdu.site4j.common.base.BasePagingQueryDto;

/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */

public class LinkQueryDto extends BasePagingQueryDto {
    private String name;
    private String description;
    private Boolean status;
    private Boolean homePageDisplay;

    public LinkQueryDto() {
    }

    public LinkQueryDto(Boolean status, Boolean homePageDisplay) {
        this.status = status;
        this.homePageDisplay = homePageDisplay;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Boolean getHomePageDisplay() {
        return homePageDisplay;
    }

    public void setHomePageDisplay(Boolean homePageDisplay) {
        this.homePageDisplay = homePageDisplay;
    }
}

