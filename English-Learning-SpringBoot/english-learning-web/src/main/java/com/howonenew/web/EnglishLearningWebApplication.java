package com.howonenew.web;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.howonenew.*"})
public class EnglishLearningWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(EnglishLearningWebApplication.class, args);
	}

}
