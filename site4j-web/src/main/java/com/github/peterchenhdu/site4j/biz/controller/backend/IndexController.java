/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.biz.controller.backend;

import com.github.peterchenhdu.site4j.common.annotation.BusinessLog;
import com.github.peterchenhdu.site4j.common.annotation.PublicService;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 后台主页
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Api(value = "后台主页")
@PublicService
@Controller
@RequestMapping("/admin")
public class IndexController {

    @ApiOperation(value = "访问后台首页")
    @BusinessLog("进入首页")
    @GetMapping(value = {""})
    public ModelAndView home() {
        return ResultUtils.view("admin/index");
    }
}
