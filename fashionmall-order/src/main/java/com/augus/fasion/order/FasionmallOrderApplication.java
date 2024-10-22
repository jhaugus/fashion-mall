package com.augus.fasion.order;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
@MapperScan("com.augus.fasion.order.dao")
public class FasionmallOrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(FasionmallOrderApplication.class, args);
    }

}
