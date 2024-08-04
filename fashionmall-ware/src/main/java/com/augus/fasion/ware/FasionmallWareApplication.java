package com.augus.fasion.ware;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.augus.fasion.ware.dao")
public class FasionmallWareApplication {

    public static void main(String[] args) {
        SpringApplication.run(FasionmallWareApplication.class, args);
    }

}
