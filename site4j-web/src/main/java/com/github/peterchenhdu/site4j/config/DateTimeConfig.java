/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.config;

import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalTimeSerializer;
import com.github.peterchenhdu.site4j.common.annotation.condition.UsesJava8Condition;
import com.github.peterchenhdu.site4j.common.util.ObjectUtils;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 * 时间日期与字符串的转换配置
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Configuration
@Conditional(UsesJava8Condition.class)
public class DateTimeConfig {

    private static final DateTimeFormatter DATETIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm:ss");

    /**
     * LocalTime、LocalDate、LocalDateTime转换
     *
     * @return Converter
     */
    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
        return builder -> {
            //@ResponseBody
            builder.serializerByType(LocalTime.class, new LocalTimeSerializer(TIME_FORMATTER));
            builder.serializerByType(LocalDate.class, new LocalDateSerializer(DATE_FORMATTER));
            builder.serializerByType(LocalDateTime.class, new LocalDateTimeSerializer(DATETIME_FORMATTER));
            //@RequestBody
            builder.deserializerByType(LocalTime.class, new LocalTimeDeserializer(TIME_FORMATTER));
            builder.deserializerByType(LocalDate.class, new LocalDateDeserializer(DATE_FORMATTER));
            builder.deserializerByType(LocalDateTime.class, new LocalDateTimeDeserializer(DATETIME_FORMATTER));
        };
    }

    /**
     * 请求参数LocalDateTime转换(get方法url上的参数)
     *
     * @return Converter
     */
    @Bean
    public Converter<String, LocalDateTime> LocalDateTimeConvert() {
        //注意，不能转成lambda表达式，会报错
        return new Converter<String, LocalDateTime>() {
            @Override
            public LocalDateTime convert(String source) {
                LocalDateTime date = null;
                if (ObjectUtils.isNotEmpty(source)) {
                    date = LocalDateTime.parse(source, DATETIME_FORMATTER);
                }
                return date;
            }
        };
    }

    /**
     * 请求参数LocalDate转换
     *
     * @return Converter
     */
    @Bean
    public Converter<String, LocalDate> LocalDateConvert() {
        //注意，不能转成lambda表达式，会报错
        return new Converter<String, LocalDate>() {
            @Override
            public LocalDate convert(String source) {
                LocalDate date = null;
                if (ObjectUtils.isNotEmpty(source)) {
                    date = LocalDate.parse(source, DATE_FORMATTER);
                }
                return date;
            }
        };
    }

    /**
     * 请求参数LocalTime转换
     *
     * @return Converter
     */
    @Bean
    public Converter<String, LocalTime> LocalTimeConvert() {
        //注意，不能转成lambda表达式，会报错
        return new Converter<String, LocalTime>() {
            @Override
            public LocalTime convert(String source) {
                LocalTime time = null;
                if (ObjectUtils.isNotEmpty(source)) {
                    time = LocalTime.parse(source, TIME_FORMATTER);
                }
                return time;
            }
        };
    }


}
