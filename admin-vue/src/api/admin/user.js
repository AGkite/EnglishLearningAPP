import { instance } from "@/axios";

// 登录接口
export function login(adminLoginRequest) {
    return instance.post("/api/admin/login", adminLoginRequest)
}

//用户信息
export function getUserInfo() {
    return instance.get("/")
}