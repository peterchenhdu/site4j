/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.util;


import com.github.peterchenhdu.site4j.common.base.PageResult;
import com.github.peterchenhdu.site4j.common.base.Response;
import com.github.peterchenhdu.site4j.common.constant.CommonConstants;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.PageInfo;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 接口返回工具类，支持ModelAndView、ResponseVO、PageResult
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/18 11:48
 * @since 1.0
 */
public class ResultUtils {

    public static ModelAndView view(String view) {
        return new ModelAndView(view);
    }

    public static ModelAndView view(String view, Map<String, Object> model) {
        return new ModelAndView(view, model);
    }

    public static ModelAndView redirect(String view) {
        return new ModelAndView("redirect:" + view);
    }

    public static Response error(int code, String message) {
        return vo(code, message, null);
    }

    public static Response error(ResponseStatus status) {
        return vo(status.getCode(), status.getMessage(), null);
    }

    public static Response error(String message) {
        return vo(CommonConstants.DEFAULT_ERROR_CODE, message, null);
    }

    public static <T> Response<T> success(String message, T data) {
        return vo(CommonConstants.DEFAULT_SUCCESS_CODE, message, data);
    }
    public static <T> Response<T> success( T data) {
        return vo(CommonConstants.DEFAULT_SUCCESS_CODE, "操作成功", data);
    }

    public static Response success(String message) {
        return success(message, null);
    }

    public static Response success(ResponseStatus status) {
        return vo(status.getCode(), status.getMessage(), null);
    }

    public static <T> Response<T> vo(int code, String message, T data) {
        return new Response<>(code, message, data);
    }

    public static PageResult tablePage(Long total, List<?> list) {
        return new PageResult(total, list);
    }

    public static PageResult tablePage(PageInfo info) {
        if (info == null) {
            return new PageResult(0L, new ArrayList());
        }
        return tablePage(info.getTotal(), info.getList());
    }

}
