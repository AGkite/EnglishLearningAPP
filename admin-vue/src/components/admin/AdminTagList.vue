<template>
    <!-- 左边：标签导航栏 -->
    <div class="fixed top-[64px] h-[44px] px-2 right-0 z-50 flex items-center bg-white transition-all duration-300 shadow"
        :style="{ left: menuStore.menuWidth }">
        <el-tabs v-model="activeTab" type="card" class="demo-tabs" @tab-remove="removeTab" style="min-width: 10px;">
            <el-tab-pane v-for="item in tabList" :key="item.path" :label="item.title" :name="item.path"
                :closable="item.path != '/admin/index'">
            </el-tab-pane>
        </el-tabs>
        <!-- 右侧下拉菜单 -->
        <span class="ml-auto flex items-center justify-center h-[32px] w-[32px]">
            <el-dropdown>
                <span class="el-dropdown-link">
                    <el-icon>
                        <arrow-down />
                    </el-icon>
                </span>
                <template #dropdown>
                    <el-dropdown-menu>
                        <el-dropdown-item>关闭其他</el-dropdown-item>
                        <el-dropdown-item>关闭全部</el-dropdown-item>
                    </el-dropdown-menu>
                </template>
            </el-dropdown>
        </span>
    </div>
    <div class="h-[44px]"></div>
</template>

<script setup>
import { ref } from 'vue'
import { useRoute } from 'vue-router'
import { useMenuStore } from '@/stores/menu'

const route = useRoute()
const menuStore = useMenuStore()

// 当前被选中的 tab
const activeTab = ref(route.path)
// 导航栏 tab 数组
const tabList = ref([
    {
        title: '仪表盘',
        path: "/admin/index"
    },
    {
        title: '课程管理',
        path: "/admin/course/list"
    },
    {
        title: '文章管理',
        path: "/admin/article/list"
    },
    {
        title: '题目管理',
        path: "/admin/problem/list"
    },
    {
        title: '应用设置',
        path: "/admin/app/setting"
    }
])

const addTab = (targetName) => {
    const newTabName = `${++tabIndex}`
    editableTabs.value.push({
        title: 'New Tab',
        name: newTabName,
        content: 'New Tab content',
    })
    editableTabsValue.value = newTabName
}
const removeTab = (targetName) => {
    const tabs = editableTabs.value
    let activeName = editableTabsValue.value
    if (activeName === targetName) {
        tabs.forEach((tab, index) => {
            if (tab.name === targetName) {
                const nextTab = tabs[index + 1] || tabs[index - 1]
                if (nextTab) {
                    activeName = nextTab.name
                }
            }
        })
    }

    editableTabsValue.value = activeName
    editableTabs.value = tabs.filter((tab) => tab.name !== targetName)
}
</script>

<style>
.el-tabs__item {
    font-size: 12px;
    border: 1px solid #d8dce5 !important;
    border-radius: 3px !important;
}

.el-tabs--card>.el-tabs__header .el-tabs__item {
    margin-left: 0.1rem !important;
    margin-right: 0.1rem !important;
}

.el-tabs__item.is-active {
    background-color: var(--el-color-primary) !important;
    color: #fff;
}

.el-tabs__item.is-active::before {
    content: "";
    background-color: #fff;
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    position: relative;
    margin-right: 4px;
}

.el-tabs {
    height: 32px;
}

.el-tabs__header {
    margin-bottom: 0;
}

.el-tabs--card>.el-tabs__header .el-tabs__nav {
    border: 0;
}

.el-tabs--card>.el-tabs__header .el-tabs__item {
    height: 32px;
    line-height: 32px;
    border: 0;
    background: #fff;
}

.el-tabs--card>.el-tabs__header {
    border: 0;
}

.el-tabs__nav-prev,
.el-tabs__nav-next {
    line-height: 35px;
}

.is-disabled {
    cursor: not-allowed;
    color: #d1d5db;
}
</style>