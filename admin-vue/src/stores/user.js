import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useUserStore = defineStore('user', () => {
  // 用户信息
  const userInfo = ref({})

  // 设置用户信息
  function setUserInfo(username) {
    // 调用后头获取用户信息接口
    userInfo.value = { username: username }
  }

  //退出登录
  function logout() {
    //删除登录用户的信息
    userInfo.value={}
  }

  return { userInfo, setUserInfo,logout }
},
{
  // 开启持久化
  persist: true,
}
)
