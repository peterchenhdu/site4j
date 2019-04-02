/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.exception;

/**
 * BaseRuntimeException
 *
 * @author PiChen
 * @since 2018/10/20 23:03
 */
public class BaseRuntimeException extends RuntimeException {

    public BaseRuntimeException() {
        super();
    }


    public BaseRuntimeException(String message) {
        super(message);
    }


    public BaseRuntimeException(String message, Throwable cause) {
        super(message, cause);
    }
}
