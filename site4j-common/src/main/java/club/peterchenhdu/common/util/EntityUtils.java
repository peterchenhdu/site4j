/*
 * Copyright (c) 2011-2025 PiChen
 */

package club.peterchenhdu.common.util;


import club.peterchenhdu.common.base.BaseEntity;

import java.time.LocalDateTime;

/**
 * @author PiChen
 * @since 2019/3/10
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
