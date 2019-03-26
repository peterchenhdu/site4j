/*
 * Copyright © 2018-2025 The Hikvision Company. All Rights Reserved.
 */

package club.peterchenhdu.config;


import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.util.LogUtils;
import club.peterchenhdu.util.ResultUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Component
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler
    public Response handle(BindException bindException) {
        //获取第一个诊断错误
        FieldError error = bindException.getBindingResult().getFieldError();
        String message = error.getDefaultMessage();
        String field = error.getField();


        return ResultUtils.error("参数错误:"+message);
    }


    @ExceptionHandler
    public Response handle(Exception e) {
        LogUtils.exception(e);
        return ResultUtils.error("未知错误,请联系系统管理员");
    }

}


