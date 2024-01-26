package com.howonenew.web.service;

import com.howonenew.common.utils.Response;
import com.howonenew.web.controller.UserController;
import com.howonenew.web.model.LoginRequest;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class UserControllerTest {

    @Test
    public void testLoginSuccess() {
        // 创建 mock 的 userService
        UserService userService = mock(UserService.class);
        when(userService.login("newone", "123456")).thenReturn(true);
        // 创建 controller
        UserController yourController = new UserController(userService);
        // 创建测试用的 LoginRequest
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setUsername("newone");
        loginRequest.setPassword("123456");
        // 调用 controller 方法
        Response responseEntity = yourController.login(loginRequest);
        // 验证返回结果是否符合预期
        assertEquals(Response.success("登录成功!"), responseEntity);
        // 验证 userService 的 login 方法是否被调用
        verify(userService, times(1))
                .login("newone", "123456");
    }

    @Test
    public void testLoginFail() {
        // 创建 mock 的 userService
        UserService userService = mock(UserService.class);
        when(userService.login("invalidUser", "invalidPassword")).thenReturn(false);

        // 创建 controller
        UserController yourController = new UserController(userService);

        // 创建测试用的 LoginRequest
        LoginRequest loginRequest = new LoginRequest();
        loginRequest.setUsername("invalidUser");
        loginRequest.setPassword("invalidPassword");

        // 调用 controller 方法
        Response responseEntity = yourController.login(loginRequest);

        // 验证返回结果是否符合预期
        assertEquals("登录失败！", responseEntity.getMessage());

        // 验证 userService 的 login 方法是否被调用
        verify(userService, times(1)).login("invalidUser", "invalidPassword");
    }
}
