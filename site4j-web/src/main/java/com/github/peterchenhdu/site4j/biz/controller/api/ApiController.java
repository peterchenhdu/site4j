/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.biz.controller.api;

import com.github.peterchenhdu.site4j.common.annotation.PublicService;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * 对外接口
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@PublicService
@RestController
@RequestMapping("/api")
public class ApiController {
    @ApiOperation(value="test")
    @GetMapping("/test")
    public BaseResponse<Param> saveRoleResources(Param Param) {
        Param.setTime(LocalDateTime.now());
        Param.setLocaltime(LocalDateTime.now().toLocalTime());
        return ResultUtils.success(Param);
    }
}
