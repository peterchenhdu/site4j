/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.util;


import com.github.peterchenhdu.site4j.common.base.BasePagingResultDto;
import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.dto.PageInfoDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 接口返回工具类，支持ModelAndView、ResponseVO、PageResult
 * <p>
 * Created by chenpi on 2019/02/05.
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

    public static BaseResponse error(int code, String message) {
        return vo(code, message, null);
    }

    public static BaseResponse error(ResponseStatus status) {
        return vo(status.getCode(), status.getMessage(), null);
    }

    public static BaseResponse error(String message) {
        return vo(HttpStatus.INTERNAL_SERVER_ERROR.value(), message, null);
    }

    public static <T> BaseResponse<T> success(String message, T data) {
        return vo(HttpStatus.OK.value(), message, data);
    }
    public static <T> BaseResponse<T> success(T data) {
        return vo(HttpStatus.OK.value(), "操作成功", data);
    }

    public static BaseResponse success(String message) {
        return success(message, null);
    }

    public static BaseResponse success(ResponseStatus status) {
        return vo(status.getCode(), status.getMessage(), null);
    }

    public static <T> BaseResponse<T> vo(int code, String message, T data) {
        return new BaseResponse<>(code, message, data);
    }

    public static BasePagingResultDto tablePage(Long total, List<?> list) {
        return new BasePagingResultDto(total, list);
    }

    public static BasePagingResultDto tablePage(PageInfoDto info) {
        if (info == null) {
            return new BasePagingResultDto(0L, new ArrayList());
        }
        return tablePage(info.getTotal(), info.getList());
    }

}
