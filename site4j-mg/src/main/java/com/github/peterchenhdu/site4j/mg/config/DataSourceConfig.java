/*
 * Copyright (c) 2011-2025 PiChen
 */
package com.github.peterchenhdu.site4j.mg.config;

import com.baomidou.mybatisplus.exceptions.MybatisPlusException;
import com.github.peterchenhdu.site4j.mg.config.converts.MySqlTypeConvert;
import com.github.peterchenhdu.site4j.mg.config.converts.OracleTypeConvert;
import com.github.peterchenhdu.site4j.mg.config.converts.PostgreSqlTypeConvert;
import com.github.peterchenhdu.site4j.mg.config.converts.SqlServerTypeConvert;
import com.github.peterchenhdu.site4j.mg.config.querys.MySqlQuery;
import com.github.peterchenhdu.site4j.mg.config.querys.OracleQuery;
import com.github.peterchenhdu.site4j.mg.config.querys.PostgreSqlQuery;
import com.github.peterchenhdu.site4j.mg.config.querys.SqlServerQuery;
import com.github.peterchenhdu.site4j.mg.config.rules.DbType;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * <p>
 * 数据库配置
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class DataSourceConfig {

    /**
     * 数据库信息查询
     */
    private IDbQuery dbQuery;
    /**
     * 数据库类型
     */
    private DbType dbType;
    /**
     * PostgreSQL schemaname
     */
    private String schemaname = "public";
    /**
     * 类型转换
     */
    private ITypeConvert typeConvert;
    /**
     * 驱动连接的URL
     */
    private String url;
    /**
     * 驱动名称
     */
    private String driverName;
    /**
     * 数据库连接用户名
     */
    private String username;
    /**
     * 数据库连接密码
     */
    private String password;

    public IDbQuery getDbQuery() {
        if (null == dbQuery) {
            switch (getDbType()) {
                case ORACLE:
                    dbQuery = new OracleQuery();
                    break;
                case SQL_SERVER:
                    dbQuery = new SqlServerQuery();
                    break;
                case POSTGRE_SQL:
                    dbQuery = new PostgreSqlQuery();
                    break;
                default:
                    // 默认 MYSQL
                    dbQuery = new MySqlQuery();
                    break;
            }
        }
        return dbQuery;
    }

    public DataSourceConfig setDbQuery(IDbQuery dbQuery) {
        this.dbQuery = dbQuery;
        return this;
    }

    /**
     * 判断数据库类型
     *
     * @return 类型枚举值
     */
    public DbType getDbType() {
        if (null == dbType) {
            if (driverName.contains("mysql")) {
                dbType = DbType.MYSQL;
            } else if (driverName.contains("oracle")) {
                dbType = DbType.ORACLE;
            } else if (driverName.contains("postgresql")) {
                dbType = DbType.POSTGRE_SQL;
            } else {
                throw new MybatisPlusException("Unknown type of database!");
            }
        }
        return dbType;
    }

    public DataSourceConfig setDbType(DbType dbType) {
        this.dbType = dbType;
        return this;
    }

    public String getSchemaname() {
        return schemaname;
    }

    public void setSchemaname(String schemaname) {
        this.schemaname = schemaname;
    }

    public ITypeConvert getTypeConvert() {
        if (null == typeConvert) {
            switch (getDbType()) {
                case ORACLE:
                    typeConvert = new OracleTypeConvert();
                    break;
                case SQL_SERVER:
                    typeConvert = new SqlServerTypeConvert();
                    break;
                case POSTGRE_SQL:
                    typeConvert = new PostgreSqlTypeConvert();
                    break;
                default:
                    // 默认 MYSQL
                    typeConvert = new MySqlTypeConvert();
                    break;
            }
        }
        return typeConvert;
    }

    public DataSourceConfig setTypeConvert(ITypeConvert typeConvert) {
        this.typeConvert = typeConvert;
        return this;
    }

    /**
     * 创建数据库连接对象
     *
     * @return Connection
     */
    public Connection getConn() {
        Connection conn = null;
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public String getUrl() {
        return url;
    }

    public DataSourceConfig setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getDriverName() {
        return driverName;
    }

    public DataSourceConfig setDriverName(String driverName) {
        this.driverName = driverName;
        return this;
    }

    public String getUsername() {
        return username;
    }

    public DataSourceConfig setUsername(String username) {
        this.username = username;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public DataSourceConfig setPassword(String password) {
        this.password = password;
        return this;
    }

}
