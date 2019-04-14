/*
 * Copyright (c) 2011-2025 PiChen
 */

package com.github.peterchenhdu.site4j.mg;

import com.github.peterchenhdu.site4j.mg.config.DataSourceConfig;
import com.github.peterchenhdu.site4j.mg.config.GlobalConfig;
import com.github.peterchenhdu.site4j.mg.config.PackageConfig;
import com.github.peterchenhdu.site4j.mg.config.StrategyConfig;
import com.github.peterchenhdu.site4j.mg.config.rules.DbType;
import com.github.peterchenhdu.site4j.mg.config.rules.NamingStrategy;

/**
 * Mybatis Plus代码生成器
 * <p>
 * Created by chenpi on 2019/02/05.
 */
public class MybatisPlusCodeGenerator {

    /**
     * 需要生成的表
     */
    private static final String[] TABLES = new String[]{"resource"};
    /**
     * Service接口是否以I打头
     */
    private static final boolean SERVICE_NAME_START_WITH_I = true;
    /**
     * 生成代码的包名
     */
    private static final String PACKAGE_NAME = "com.github.peterchenhdu.site4j.biz";
    /**
     * 生成代码所在的文件夹
     */
    private static final String OUTPUT_DIR = "E:\\CodeGen";
    /**
     * JDBC URL
     */
    private static final String JDBC_URL = "jdbc:postgresql://localhost:5432/site4j";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "123456";


    public static void main(String[] args) {
        System.out.println("开始生产代码...");
        generateByTables(TABLES);
        System.out.println("生成代码结束...");
    }

    /**
     * 根据表名生成代码
     *
     * @param tableNames 表名
     */

    private static void generateByTables(String... tableNames) {
        //数据源相关配置
        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        dataSourceConfig.setDbType(DbType.POSTGRE_SQL)
                .setUrl(JDBC_URL)
                .setUsername(USERNAME)
                .setPassword(PASSWORD)
                .setDriverName("org.postgresql.Driver");

        //生成代码策略配置
        StrategyConfig strategyConfig = new StrategyConfig();
        strategyConfig.setCapitalMode(true)
                .setEntityLombokModel(false)
                .setNaming(NamingStrategy.underline_to_camel)
                .setInclude(tableNames);//修改替换成你需要的表名，多个表名传数组

        //全局配置
        GlobalConfig config = new GlobalConfig();
        config.setActiveRecord(false)
                .setAuthor(System.getProperty("user.name"))
                .setOutputDir(OUTPUT_DIR)
                .setFileOverride(true)
                .setEnableCache(false);
        if (!SERVICE_NAME_START_WITH_I) {
            config.setServiceName("%sService");
        }

        //包配置
        PackageConfig packageConfig = new PackageConfig();
        packageConfig.setParent(PACKAGE_NAME)
                .setController("web")
                .setEntity("model")
                .setMapper("mapper")
                .setService("service")
                .setServiceImpl("service.impl")
                .setXml("mybatis.mappers");

        //执行自动生成代码
        new AutoGenerator().setDataSource(dataSourceConfig)
                .setStrategy(strategyConfig)
                .setGlobalConfig(config)
                .setPackageInfo(packageConfig)
                .execute();
    }
}