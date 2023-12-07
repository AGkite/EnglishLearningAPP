package com.howonenew.admin.service;

public interface AdminUserService {
    /**
     * 登录
     * @param username
     * @param password
     */
    boolean login(String username, String password);
}
