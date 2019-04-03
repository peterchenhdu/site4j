/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.core;


import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.util.ResultUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;

@Component
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler
    public BaseResponse handle(BindException bindException) {
        //获取第一个诊断错误
        FieldError error = bindException.getBindingResult().getFieldError();
        String message = error.getDefaultMessage();
//        String field = error.getField();


        return ResultUtils.error("参数错误:"+message);
    }

    @ExceptionHandler
    public BaseResponse handleConstraintViolationException(ConstraintViolationException exception) {
        //获取第一个诊断错误
        return ResultUtils.error("参数错误:"+exception.getMessage());
    }

    @ExceptionHandler
    public BaseResponse handle(Exception e) {
        LogUtils.exception(e);
        return ResultUtils.error("未知错误,请联系系统管理员");
    }

}


