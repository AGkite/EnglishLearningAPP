<template>
    <!-- 设置背景色为白色、高度为 64px，padding-right 为 4， border-bottom 为 slate 200 -->
    <div class="bg-white h-[64px] flex pr-4 border-b border-slate-100">
        <!-- 左边栏收缩、展开 -->
        <div class="w-[42px] h-[64px] cursor-pointer flex items-center justify-center text-gray-700 hover:bg-gray-200"
            @click="handleMenuWidth">
            <el-icon>
                <Fold v-if="menuStore.menuWidth == '250px'" />
                <Expand v-else />
            </el-icon>
        </div>

        <!-- 右边容器，通过 ml-auto 让其在父容器的右边 -->
        <div class="ml-auto flex">
            <!-- 点击刷新页面 -->
            <el-tooltip class="box-item" effect="dark" content="刷新" placement="bottom">
                <div class="w-[42px] h-[64px] cursor-pointer flex items-center justify-center text-gray-700 hover:bg-gray-200"
                    @click="handleRefresh">
                    <el-icon>
                        <Refresh />
                    </el-icon>
                </div>
            </el-tooltip>
            <!-- 点击全屏展示 -->
            <el-tooltip class="box-item" effect="dark" content="全屏" placement="bottom">
                <div class="w-[42px] h-[64px] cursor-pointer flex items-center justify-center text-gray-700 mr-2 hover:bg-gray-200"
                    @click="toggle">
                    <el-icon>
                        <FullScreen v-if="!isFullscreen" />
                        <Aim v-else />
                    </el-icon>
                </div>
            </el-tooltip>

            <!-- 登录用户头像 -->
            <el-dropdown class="flex items-center justify-center">
                <span class="el-dropdown-link flex items-center justify-center text-gray-700 text-xs">
                    <!-- 头像 Avatar -->
                    <el-avatar class="mr-2" :size="25"
                        src="https://img.quanxiaoha.com/quanxiaoha/f97361c0429d4bb1bc276ab835843065.jpg" />
                    Admin
                    <el-icon class="el-icon--right">
                        <arrow-down />
                    </el-icon>
                </span>
                <template #dropdown>
                    <el-dropdown-menu>
                        <el-dropdown-item>修改密码</el-dropdown-item>
                        <el-dropdown-item>退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </div>
    </div>
</template>

<script setup>
import { useMenuStore } from '@/stores/menu'
// 引入 useFullscreen
import { useFullscreen } from '@vueuse/core'

// isFullscreen 表示当前是否处于全屏；toggle 用于动态切换全屏、非全屏
const { isFullscreen, toggle } = useFullscreen()

// 引入了菜单 store
const menuStore = useMenuStore()

// icon 点击事件
const handleMenuWidth = () => {
    // 动态设置菜单的宽度大小
    menuStore.handleMenuWidth()
}

// 刷新页面
const handleRefresh = () => location.reload()

</script>