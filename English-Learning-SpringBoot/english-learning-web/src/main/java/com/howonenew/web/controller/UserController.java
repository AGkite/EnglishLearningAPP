package com.howonenew.web.controller;

import com.howonenew.common.enums.ResponseCodeEnum;
import com.howonenew.common.utils.Response;
import com.howonenew.web.model.LoginRequest;
import com.howonenew.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public Response login(@RequestBody LoginRequest loginRequest) {
        String username = loginRequest.getUsername();
        String password = loginRequest.getPassword();
        boolean login = userService.login(username, password);
        if (login) {
            return Response.success("登录成功！");
        }
        return  Response.fail(ResponseCodeEnum.LOGIN_FAIL.getErrorMessage());
    }
}
