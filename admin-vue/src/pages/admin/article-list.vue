<template>
    <div class="flex justify-center p-2 min-h-screen bg-gray-100">
        <div class="w-full max-w-screen-md p-8 bg-white shadow-md rounded-lg overflow-y-auto">
        <h2 class="text-2xl font-bold mb-6">更新文章信息</h2>
        <form @submit.prevent="submitForm">
          <div class="mb-4">
            <label for="title" class="block text-sm font-medium text-gray-600">文章标题:</label>
            <input v-model="article.title" type="text" id="title" required
                   class="mt-1 p-2 w-full border rounded-md">
          </div>
  
          <div class="mb-4">
            <label for="cover" class="block text-sm font-medium text-gray-600">文章封面:</label>
            <div class="mt-1">
              <!-- 使用 tailwindcss 中的类来定义宽度 -->
              <ImageUpload class="w-full" @childData="receiveDataFromChild"></ImageUpload>
            </div>
          </div>

          <div class="mb-4">
            <label for="summary" class="block text-sm font-medium text-gray-600">文章摘要:</label>
            <textarea v-model="article.summary" id="summary" required
                      class="mt-1 p-2 w-full border rounded-md"></textarea>
          </div>
  
          <div class="mb-4">
            <label for="content" class="block text-sm font-medium text-gray-600">文章正文:</label>
            <textarea v-model="article.content" id="content" required
                      class="mt-1 p-2 w-full border rounded-md"></textarea>
          </div>
  
          <button type="submit"
                  class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">
            提交
          </button>
        </form>
      </div>
    </div>
  </template>

<script setup>
import ImageUpload from '@/components/ImageUpload.vue';
import { addArticle } from "@/api/admin/article";
import { ref,reactive } from 'vue';
import { showMessage } from '@/utils/util';

const receivedData = ref('')

const article = reactive({
    title: '',
    cover: '',
    summary: '',
    content: ''
});
function receiveDataFromChild(data) {
  // 接收来自子组件的数据
  receivedData.value = data;
  article.cover = data
  console.log(data)
}
const submitForm = async () => {
    // 在这里触发更新数据库的操作，可以使用异步请求（如axios）将数据发送到后端
    try {
        const response = await addArticle(article)
        showMessage("添加文章成功！")
    } catch (error) {
        showMessage("添加文章失败！","warning")
    }

};

</script>