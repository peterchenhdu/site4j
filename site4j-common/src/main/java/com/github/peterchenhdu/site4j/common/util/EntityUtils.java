/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.util;


import com.github.peterchenhdu.site4j.common.base.BaseEntity;

import java.time.LocalDateTime;

/**
 * 实体类公共处理方法
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class EntityUtils {

    public static void preInsert(BaseEntity entity) {
        LocalDateTime now = LocalDateTime.now();
        entity.setUpdateTime(now);
        entity.setCreateTime(now);
        entity.setId(UuidUtils.getUuid());
    }

    public static void preUpdate(BaseEntity entity) {
        LocalDateTime now = LocalDateTime.now();
        entity.setUpdateTime(now);
    }
}
