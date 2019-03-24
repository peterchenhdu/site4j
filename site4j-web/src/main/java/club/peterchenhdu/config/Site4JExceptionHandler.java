/*
 * Copyright (c) 2011-2025 PiChen
 */
package club.peterchenhdu.config;


import club.peterchenhdu.common.base.Response;
import club.peterchenhdu.common.constant.CommonConst;
import club.peterchenhdu.common.enums.ResponseStatus;
import club.peterchenhdu.common.exception.*;
import club.peterchenhdu.util.ResultUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.lang.reflect.UndeclaredThrowableException;

/**
 * 统一异常处理类<br>
 * 捕获程序所有异常，针对不同异常，采取不同的处理方式
 *
 * @author chenpi
 * @version 1.0
 *
 * @since 2018/4/24 14:37
 * @since 1.0
 */
@Slf4j
@ControllerAdvice
public class Site4JExceptionHandler {

    /**
     * Shiro权限认证异常
     *
     * @param e
     * @return
     */
    @ExceptionHandler(value = {UnauthorizedException.class, AccountException.class})
    @ResponseBody
    public Response unauthorizedExceptionHandle(Throwable e) {
        e.printStackTrace(); // 打印异常栈
        return ResultUtils.error(HttpStatus.UNAUTHORIZED.value(), e.getLocalizedMessage());
    }

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public Response handle(Throwable e) {
        if (e instanceof ArticleException
                || e instanceof CommentException
                || e instanceof FileException
                || e instanceof LinkException
                || e instanceof BaseRuntimeException) {
            return ResultUtils.error(e.getMessage());
        }
        if (e instanceof UndeclaredThrowableException) {
            e = ((UndeclaredThrowableException) e).getUndeclaredThrowable();
        }
        ResponseStatus responseStatus = ResponseStatus.getResponseStatus(e.getMessage());
        if (responseStatus != null) {
            log.error(responseStatus.getMessage());
            return ResultUtils.error(responseStatus.getCode(), responseStatus.getMessage());
        }
        e.printStackTrace(); // 打印异常栈
        return ResultUtils.error(CommonConst.DEFAULT_ERROR_CODE, ResponseStatus.ERROR.getMessage());
    }

}
