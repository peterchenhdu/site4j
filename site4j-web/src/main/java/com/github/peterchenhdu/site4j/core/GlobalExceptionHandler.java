/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.core;


import com.github.peterchenhdu.site4j.common.base.BaseResponse;
import com.github.peterchenhdu.site4j.common.util.I18nUtils;
import com.github.peterchenhdu.site4j.common.util.LogUtils;
import com.github.peterchenhdu.site4j.common.util.ResultUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.validation.ConstraintViolationException;

@Component
@RestControllerAdvice
public class GlobalExceptionHandler {



    @ExceptionHandler(value = {BindException.class, MethodArgumentNotValidException.class})
    public Object validationExceptionHandler(Exception exception) {
        BindingResult bindResult = null;
        if (exception instanceof BindException) {
            bindResult = ((BindException) exception).getBindingResult();
        } else if (exception instanceof MethodArgumentNotValidException) {
            bindResult = ((MethodArgumentNotValidException) exception).getBindingResult();
        }
        String msg;
        if (bindResult != null && bindResult.hasErrors()) {
            msg = bindResult.getAllErrors().get(0).getDefaultMessage();
            msg = I18nUtils.getMessage(msg, null, null);
        } else {
            msg = "系统繁忙，请稍后重试...";
        }
        return ResultUtils.error("参数错误:"+msg);
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


