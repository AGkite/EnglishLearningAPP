package com.howonenew.web.service;

public interface UserService {
    /**
     * 登录
     * @param username
     * @param password
     */
    boolean login(String username, String password);
}
