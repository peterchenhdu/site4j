/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config.querys;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.github.peterchenhdu.site4j.mg.config.IDbQuery;

/**
 * <p>
 * 表数据查询抽象类
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public abstract class AbstractDbQuery implements IDbQuery {


    @Override
    public boolean isKeyIdentity(ResultSet results) throws SQLException {
        return false;
    }


    @Override
    public String[] fieldCustom() {
        return null;
    }
}
