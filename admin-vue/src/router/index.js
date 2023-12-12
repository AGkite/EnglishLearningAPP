import Admin from '@/components/admin/admin.vue'
import AdminIndex from '@/pages/admin/index.vue'
import Login from '@/pages/admin/login.vue'
import AdminCourseList from '@/pages/admin/course-list.vue'
import AdminArticleList from '@/pages/admin/article-list.vue'
import AdminProblemList from '@/pages/admin/problem-list.vue'
import AdminAppSetting from '@/pages/admin/app-setting.vue'

import { createRouter, createWebHashHistory } from 'vue-router'

// 统一在这里声明所有路由
const routes = [
    {
        path: '/', // 路由地址
        component: Login, // 对应组件
        meta: { // meta 信息
            title: '登录页' // 页面标题
        }
    },
    {
        path: '/login', // 登录页
        component: Login,
        meta: {
            title: '登录页'
        }
    },
    {
        path: "/admin", // 后台首页
        component: Admin, // 对应 admin.vue 布局文件
        // 使用到 admin.vue 布局的，都需要放置在其子路由下面
        children: [
            {
                path: "/admin/index",
                component: AdminIndex,
                meta: {
                    title: '仪表盘'
                }
            },
            {
                path: "/admin/course/list",
                component: AdminCourseList,
                meta: {
                    title: '课程管理'
                }
            },
            {
                path: '/admin/article/list',
                component: AdminArticleList,
                meta: {
                    title: '文章管理'
                }
            },{
                path: '/admin/problem/list',
                component: AdminProblemList,
                meta: {
                    title: '问题管理'
                }
            },
            {
                path: '/admin/app/setting',
                component: AdminAppSetting,
                meta: {
                    title: '应用设置'
                }
            }
        ]
        
    }

]

// 创建路由
const router = createRouter({
    // 指定路由的历史管理方式，hash 模式指的是 URL 的路径是通过 hash 符号（#）进行标识
    history: createWebHashHistory(),
    // routes: routes 的缩写
    routes, 
})

// ES6 模块导出语句，它用于将 router 对象导出，以便其他文件可以导入和使用这个对象
export default router