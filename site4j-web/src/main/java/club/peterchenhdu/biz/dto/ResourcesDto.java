/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.biz.dto;

import club.peterchenhdu.biz.entity.Resource;
import club.peterchenhdu.common.util.ObjectUtils;
import org.springframework.beans.BeanUtils;

/**
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/16 16:26
 * @since 1.0
 */
public class ResourcesDto extends Resource{

    private Resource parent;
    public  ResourcesDto(Resource resource) {
        super();
        if(ObjectUtils.isEmpty(resource)) {
            return;
        }
        BeanUtils.copyProperties(resource, this);
    }

    public Resource getParent() {
        return parent;
    }

    public void setParent(Resource parent) {
        this.parent = parent;
    }
}

