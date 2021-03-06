/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.exception;

import com.github.peterchenhdu.site4j.common.constant.ErrorCodeConstants;
import com.github.peterchenhdu.site4j.common.util.I18nUtils;

/**
 * BaseRuntimeException
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class CommonRuntimeException extends RuntimeException {
    private String code;
    private String msg;

    public CommonRuntimeException() {
        super();
        this.code = ErrorCodeConstants.SYS_ERROR;
        this.msg = I18nUtils.getMessage(this.code);
    }


    public CommonRuntimeException(String code) {
        super();
        this.code = code;
        this.msg = I18nUtils.getMessage(this.code);
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }


}
