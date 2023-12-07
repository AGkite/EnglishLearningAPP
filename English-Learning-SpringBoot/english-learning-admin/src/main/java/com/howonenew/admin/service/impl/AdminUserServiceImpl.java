package com.howonenew.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.howonenew.admin.service.AdminUserService;
import com.howonenew.common.domain.dos.UserDO;
import com.howonenew.common.domain.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminUserServiceImpl implements AdminUserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public boolean login(String username, String password) {
        LambdaQueryWrapper<UserDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UserDO::getUsername,username);
        wrapper.eq(UserDO::getPassword,password);
        UserDO userDO = userMapper.selectOne(wrapper);
        return userDO != null;
    }
}
