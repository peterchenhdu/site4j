/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.util;

import com.github.peterchenhdu.site4j.common.exception.BaseRuntimeException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Json处理工具类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class JsonUtils {

    private final static ObjectMapper objectMapper = new ObjectMapper();

    //全局配置
    static {
        //有时JSON字符串中含有我们并不需要的字段，那么当对应的实体类中不含有该字段时，会抛出一个异常，
        //告诉你有些字段（java 原始类型）没有在实体类中找到, 设置为false即不抛出异常，并设置默认值 int->0 double->0.0
        objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public static ObjectMapper getInstance() {
        return objectMapper;
    }


    public static String obj2json(Object obj) {
        Assert.notNull(obj, "obj cannot be null");

        try {
            return objectMapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            throw new BaseRuntimeException("对象转换成Json字符串异常.");
        }
    }


    public static <T> T json2pojo(String jsonString, Class<T> clazz) {
        Assert.hasLength(jsonString, "json String must not be empty");
        try {
            objectMapper.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
            return objectMapper.readValue(jsonString, clazz);
        } catch (IOException e) {
            throw new BaseRuntimeException("Json字符串转换成pojo对象异常.");
        }
    }


    public static <k, v> Map<k, v> jsonToMap(String jsonString, Class<k> kType, Class<v> vType) {
        Assert.hasLength(jsonString, "json String must not be empty");
        try {
            return objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructMapType(Map.class, kType, vType));
        } catch (IOException e) {
            throw new BaseRuntimeException("Json字符串转换成Map对象异常.");
        }

    }

    public static <T> List<T> jsonToList(String jsonString, Class<T> classType) {
        Assert.hasLength(jsonString, "json String must not be empty");
        try {
            return objectMapper.readValue(jsonString, objectMapper.getTypeFactory().constructCollectionType(List.class, classType));
        } catch (IOException e) {
            throw new BaseRuntimeException("Json字符串转换成List对象异常.");
        }

    }
}
