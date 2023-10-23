package com.howonenew.common.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.howonenew.common.domain.mapper")
public class MybatisPlusConfig {
}
