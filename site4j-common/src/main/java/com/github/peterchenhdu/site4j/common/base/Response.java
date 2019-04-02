/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.common.base;

import com.github.peterchenhdu.site4j.common.enums.ResponseStatus;
import com.github.peterchenhdu.site4j.common.util.JacksonUtils;


/**
 * 基类 - 响应封装
 * <p>
 * <p>
 * Created by chenpi on 2018/04/16.
 */
public class Response<T> {
    private Integer status;
    private String message;
    private T data;

    public Response(Integer status, String message, T data) {
        this.status = status;
        this.message = message;
        this.data = data;
    }

    public Response(ResponseStatus status, T data) {
        this(status.getCode(), status.getMessage(), data);
    }

    public String toJson() {
        T t = this.getData();
        return JacksonUtils.obj2json(t);

    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
