import { createApp } from 'vue'
import App from '@/App.vue'
import '@/assets/main.css'
import 'animate.css'
//导入Pinia
import { createPinia } from 'pinia'
//Pinia数据持久化
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
// 导入 Element Plus 图标
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
// 导入路由
import router from '@/router'
const app = createApp(App)

const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)
// 引入图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}

//应用pinia
app.use(pinia)
// 应用路由
app.use(router)
app.mount('#app')