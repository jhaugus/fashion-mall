package com.augus.fasion.member;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.augus.fasion.member.dao")
public class FasionmallMemberApplication {

    public static void main(String[] args) {
        SpringApplication.run(FasionmallMemberApplication.class, args);
    }

}
