/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.entity;

import club.peterchenhdu.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class BizType extends BaseEntity {
    private String pid;
    private String name;
    private String description;
    private Integer sort;
    private Boolean available;
    private String icon;


    private BizType parent;
    private List<BizType> nodes;
}
