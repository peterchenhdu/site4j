/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config.rules;

/**
 * 数据库类型定义
 *
 * @author YangHu
 * @since 2016/8/30
 */
public enum DbType {
    MYSQL("mysql"),
    ORACLE("oracle"),
    SQL_SERVER("sql_server"),
    POSTGRE_SQL("postgre_sql"),
    OTHER("other db");


    private final String value;


    DbType(String value) {
        this.value = value;
    }


    public String getValue() {
        return value;
    }

}
