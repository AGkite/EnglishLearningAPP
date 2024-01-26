package com.howonenew.web.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.howonenew.common.domain.dos.UserDO;
import com.howonenew.common.domain.mapper.UserMapper;
import com.howonenew.web.service.UserService;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
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
