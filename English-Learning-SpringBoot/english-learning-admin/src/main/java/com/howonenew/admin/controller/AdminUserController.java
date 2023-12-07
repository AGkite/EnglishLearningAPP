package com.howonenew.admin.controller;

import com.howonenew.admin.model.AdminLoginRequest;
import com.howonenew.admin.service.AdminUserService;
import com.howonenew.common.enums.ResponseCodeEnum;
import com.howonenew.common.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin")
public class AdminUserController {
    @Autowired
    private AdminUserService adminUserService;

    @PostMapping("/login")
    public Response login(@RequestBody AdminLoginRequest loginRequest) {
        String username = loginRequest.getUsername();
        String password = loginRequest.getPassword();
        boolean login = adminUserService.login(username, password);
        if (login) {
            return Response.success("登录成功！");
        }
        return  Response.fail(ResponseCodeEnum.LOGIN_FAIL.getErrorMessage());
    }
}
