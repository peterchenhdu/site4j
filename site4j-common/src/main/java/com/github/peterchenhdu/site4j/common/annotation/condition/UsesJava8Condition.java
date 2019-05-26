/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.common.annotation.condition;

import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * Created by PiChen on 2019/5/25.
 */
public class UsesJava8Condition implements Condition {
    /**
     * Determine if the condition matches.
     */
    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        String javaVersion = System.getProperty("java.version");
        return javaVersion.contains("1.8.");
    }
}
