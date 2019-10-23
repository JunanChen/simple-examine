package com.cdtu.simpleexamine.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;

/**
 * @author junan
 * @version V1.0
 * @className TransactionManagerConfig
 * @disc    jdbc事务管理
 * @date 2019/10/11 15:48
 */
@Configuration
public class TransactionManagerConfig {

    @Autowired
    private DataSource dataSource;

    @Bean("transactionManager")
    public DataSourceTransactionManager manager() {
        return new DataSourceTransactionManager(dataSource);
    }

}