package com.augus.fasion.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.augus.fasion.product.dao")
public class FasionmallProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(FasionmallProductApplication.class, args);
    }

}
