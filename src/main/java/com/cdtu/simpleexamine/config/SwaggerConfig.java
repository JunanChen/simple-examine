package com.cdtu.simpleexamine.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author junan
 * @version V1.0
 * @className SwaggerConfig
 * @disc    swagger接口文档配置
 * @date 2019/10/9 18:13
 */
@Configuration
@EnableSwagger2
@EnableWebMvc
@ComponentScan(basePackages = "com.cdtu.simpleexamine.web.controller")
public class SwaggerConfig {
    //apiInfo对象主要是设置我们api文档的标题，描述，访问的地址，创建者等信息
    @Bean
    public ApiInfo apiInfo(){
        return new ApiInfoBuilder().title("simple-examine").description("simple-examine 检单智能巡检平台 1.0.0 接口文档").termsOfServiceUrl("127.0.0.1:8080").contact("cdtu").version("1.0.0").build();
    }
    //docket容器设置我们的文档基础信息，api包的位置，以及路劲的匹配规则（包含四种：全匹配，不匹配，正则匹配和ant匹配）
    @Bean
    public Docket docket(){
        return new Docket(DocumentationType.SWAGGER_2).apiInfo(apiInfo()).select().apis(RequestHandlerSelectors.basePackage("com.junan.web.controller")).paths(PathSelectors.any()).build();
    }
}