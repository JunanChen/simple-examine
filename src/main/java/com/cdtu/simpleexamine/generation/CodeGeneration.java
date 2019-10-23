package com.cdtu.simpleexamine.generation;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import com.baomidou.mybatisplus.generator.engine.FreemarkerTemplateEngine;


/**
 * @author junan
 * @desc 此类用于mybatisplus逆向工程代码生成
 * @date 19-4-13 下午2:13
 */
public class CodeGeneration {
    public static void main(String[] args){
        AutoGenerator mpg = new AutoGenerator();

        //全局配置
        GlobalConfig gc = new GlobalConfig();
        //项目java物理路径
        gc.setOutputDir("D:\\Idea-workspace\\simple-examine\\src\\main\\java");
        gc.setFileOverride(true);
        gc.setActiveRecord(true);//不需要ActiveRecord特性的请改为false
        gc.setEnableCache(false);//XML二级缓存
        gc.setBaseResultMap(true);//XML ResultMap
        gc.setBaseColumnList(false);//XML columList
        gc.setAuthor("junan");//作者

        //自定义文件命名，注意%s 会自动填充表实体属性
        gc.setControllerName("%sController");
        gc.setServiceName("%sService");
        gc.setServiceImplName("%sServiceImpl");
        gc.setMapperName("%sMapper");
        gc.setXmlName("%sMapper");
        mpg.setGlobalConfig(gc);

        //数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setUsername("root");
        dsc.setPassword("chenjunan");
        dsc.setUrl("jdbc:mysql://localhost:3306/simple-examine?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8");
        mpg.setDataSource(dsc);

        //策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setTablePrefix(new String[]{});                   //此处可以修改您的表前缀
        strategy.setNaming(NamingStrategy.underline_to_camel);     //表名生成策略
        strategy.setInclude(new String[]{"staff"});                       //需要生成的表

        strategy.setSuperServiceClass(null);
        strategy.setSuperServiceImplClass(null);
        strategy.setSuperMapperClass(null);

        mpg.setStrategy(strategy);

        //设置freemarker模板引擎
        FreemarkerTemplateEngine freemarkerTemplateEngine = new FreemarkerTemplateEngine();
        mpg.setTemplateEngine(freemarkerTemplateEngine);

        //包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.cdtu.simpleexamine");
        pc.setController("web.controller");
        pc.setService("service");
        pc.setMapper("mapper");
        pc.setEntity("pojo.dbo");
        pc.setXml("mapper.xml");
        mpg.setPackageInfo(pc);

        //执行生成
        mpg.execute();
    }
}
