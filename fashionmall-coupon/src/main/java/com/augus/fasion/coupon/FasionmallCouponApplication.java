package com.augus.fasion.coupon;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication
@MapperScan("com.augus.fasion.coupon.dao")
public class FasionmallCouponApplication {

    public static void main(String[] args) {
        SpringApplication.run(FasionmallCouponApplication.class, args);
    }

}
