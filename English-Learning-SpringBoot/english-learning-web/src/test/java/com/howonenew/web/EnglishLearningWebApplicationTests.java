package com.howonenew.web;

import com.howonenew.common.domain.dos.UserDO;
import com.howonenew.common.domain.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class EnglishLearningWebApplicationTests {

	@Autowired
	private UserMapper userMapper;
	@Test
	void contextLoads() {
		UserDO userDO = userMapper.findByUsername("newone");
		System.out.println(userDO);
	}
}
