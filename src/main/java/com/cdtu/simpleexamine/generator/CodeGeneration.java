package com.cdtu.simpleexamine.generator;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
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

    private static String[] tables = {"module"};

    public static void main(String[] args){
        AutoGenerator mpg = new AutoGenerator();

        //全局配置
        GlobalConfig gc = new GlobalConfig();
        //项目java物理路径
        gc.setOutputDir("D:\\Idea-workspace\\simple-examine\\src\\main\\java");
        gc.setFileOverride(true);
        gc.setActiveRecord(true);               //不需要ActiveRecord特性的请改为false
        gc.setEnableCache(false);               //XML二级缓存
        gc.setBaseResultMap(true);              //XML ResultMap
        gc.setBaseColumnList(true);             //XML columList
        gc.setAuthor("junan");                  //作者

        //自定义文件命名，注意%s 会自动填充表实体属性
        gc.setControllerName("%sController");
        gc.setServiceName("%sService");
        gc.setServiceImplName("%sServiceImpl");
        gc.setMapperName("%sMapper");
        gc.setXmlName("%sMapper");
        gc.setIdType(IdType.UUID);              // 指定生成的主键的ID类型
        mpg.setGlobalConfig(gc);

        //数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setDbType(DbType.MYSQL);
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");             //设置数据库驱动
        dsc.setUrl("jdbc:mysql://localhost:3306/simple-examine?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8"); //设置数据库URL
        dsc.setUsername("root");                                   //设置数据库登录名
        dsc.setPassword("chenjunan");                              //设置数据库登录密码
        mpg.setDataSource(dsc);

        //策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setTablePrefix(new String[]{});                   //此处可以修改您的表前缀
        strategy.setNaming(NamingStrategy.underline_to_camel);     //表名生成策略（驼峰转换）
        strategy.setInclude(tables);                               //需要生成的表

        strategy.setSuperServiceClass(null);                       //设置需要继承的service接口
        strategy.setSuperServiceImplClass(null);                   //设置需要继承的service实现类
        strategy.setSuperMapperClass(null);                        //设置需要继承的mapper接口

        strategy.setRestControllerStyle(true);                     //设置@RestController
        strategy.setEntityLombokModel(true);                       // 设置实体类lombok

        mpg.setStrategy(strategy);

        //设置freemarker模板引擎
        FreemarkerTemplateEngine freemarkerTemplateEngine = new FreemarkerTemplateEngine();
        mpg.setTemplateEngine(freemarkerTemplateEngine);

        //包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.cdtu.simpleexamine");                             //设置包结构
        pc.setController("web.controller");                        //设置controller输出位置
        pc.setService("service");                                  //设置service输出位置
        pc.setMapper("mapper");                                    //设置mapper输出位置
        pc.setEntity("pojo.dbo");                                  //设置实体输出位置
        pc.setXml("mapper.xml");                                   //设置mapper.xml输出位置
        mpg.setPackageInfo(pc);

        //执行生成
        mpg.execute();
    }
}
