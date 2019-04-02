/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config.converts;

import com.github.peterchenhdu.site4j.mg.config.ITypeConvert;
import com.github.peterchenhdu.site4j.mg.config.rules.DbColumnType;

/**
 * <p>
 * SQLServer 字段类型转换
 * </p>
 *
 * @author hubin
 * @date 2017-01-20
 */
public class SqlServerTypeConvert implements ITypeConvert {

    @Override
    public DbColumnType processTypeConvert(String fieldType) {
        String t = fieldType.toLowerCase();
        if (t.contains("char") || t.contains("text") || t.contains("xml")) {
            return DbColumnType.STRING;
        } else if (t.contains("bigint")) {
            return DbColumnType.LONG;
        } else if (t.contains("int")) {
            return DbColumnType.INTEGER;
        } else if (t.contains("date") || t.contains("time")) {
            return DbColumnType.DATE;
        } else if (t.contains("text")) {
            return DbColumnType.STRING;
        } else if (t.contains("bit")) {
            return DbColumnType.BOOLEAN;
        } else if (t.contains("decimal") || t.contains("numeric")) {
            return DbColumnType.DOUBLE;
        } else if (t.contains("money")) {
            return DbColumnType.BIG_DECIMAL;
        } else if (t.contains("binary") || t.contains("image")) {
            return DbColumnType.BYTE_ARRAY;
        } else if (t.contains("float") || t.contains("real")) {
            return DbColumnType.FLOAT;
        }
        return DbColumnType.STRING;
    }

}
