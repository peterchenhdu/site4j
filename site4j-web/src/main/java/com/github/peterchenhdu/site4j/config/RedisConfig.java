/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;

import java.time.Duration;


/**
 * <p>
 * Created by chenpi on 2019/02/05.
 */
@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport {

    /**
     * 缓存数据时Key的生成器，可以依据业务和技术场景自行定制
     *
     * @return
     */
    @Bean
    @Override
    @Deprecated
    public KeyGenerator keyGenerator() {
        return (target, method, params) -> {
            StringBuilder sb = new StringBuilder();
            //类名+方法名
            sb.append(target.getClass().getName());
            sb.append(".").append(method.getName());
            for (Object obj : params) {
                sb.append(String.valueOf(obj));
            }
            System.out.println("============:" + sb.toString());
            return sb.toString();
        };
    }

    @Bean
    public CacheManager cacheManager(RedisConnectionFactory factory) {
        return RedisCacheManager.builder(RedisCacheWriter.nonLockingRedisCacheWriter(factory))
                // 默认缓存过期时间：天
                .cacheDefaults(RedisCacheConfiguration.defaultCacheConfig().entryTtl(Duration.ofDays(30)))
                .transactionAware()
                .build();
    }

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(factory);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);

        om.registerModule(new ParameterNamesModule())
                .registerModule(new Jdk8Module())
                .registerModule(new JavaTimeModule()); // new module, NOT JSR310Module
        om.findAndRegisterModules();
        om.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);

        GenericJackson2JsonRedisSerializer jackson2JsonRedisSerializer = new GenericJackson2JsonRedisSerializer(om);
        template.setValueSerializer(jackson2JsonRedisSerializer);
        template.setKeySerializer(jackson2JsonRedisSerializer);
        template.afterPropertiesSet();
        return template;
    }
}
