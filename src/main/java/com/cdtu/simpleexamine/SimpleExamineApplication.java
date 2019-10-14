package com.cdtu.simpleexamine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource("classpath:jdbc.properties")
public class SimpleExamineApplication {

    public static void main(String[] args) {
        SpringApplication.run(SimpleExamineApplication.class, args);
    }

}
