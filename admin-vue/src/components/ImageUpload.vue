<template>
    <div class="sm:max-w-lg w-full p-2 bg-white rounded-xl z-10">
        <form class="mt-8 space-y-3">
            <div class="grid grid-cols-1 space-y-2">
                <label class="text-sm font-bold text-gray-500 tracking-wide">上传图片</label>
                <div class="flex items-center justify-center w-full">
                    <label class="flex flex-col rounded-lg border-4 border-dashed w-full h-60 p-10 group text-center">
                        <div class="h-full w-full text-center flex flex-col items-center justify-center">
                            <div class="flex flex-auto max-h-48 w-3/5 mx-auto -mt-10">
                                <img class="has-mask h-36 object-center" :src="imageSrc" alt="upload image" />
                            </div>
                            <p class="pointer-none text-gray-500">
                                <span class="text-sm">拖拽</span>图片<br />
                                或
                                <span href="#" id="" class="text-blue-600 hover:underline">选取图片</span>
                            </p>
                        </div>
                        <input accept=".png, .jpg, .jpeg, .webp, .gif" type="file" class="hidden"
                            @change="handleFileChange" />
                    </label>
                </div>
            </div>
            <p class="text-sm text-gray-300">
                <span>File type: jpg, jpeg, png, webp, gif</span>
            </p>
            <div>
                <button @click.prevent="uploadHandler"
                    class="my-5 w-full flex justify-center bg-blue-500 text-gray-100 p-4 rounded-full tracking-wide font-semibold focus:outline-none focus:shadow-outline hover:bg-blue-600 shadow-lg cursor-pointer transition ease-in duration-300">
                    上传至服务器
                </button>
            </div>
        </form>
    </div>
</template>
<script setup>
import imgPath from "../assets/upload.webp";
import { uploadImg } from "@/api/admin/common";
import { showMessage } from '@/utils/util';
import { ref } from 'vue'

const imageSrc = ref(imgPath)
const emit = defineEmits(['childData'])
const childCover = ref('')

// 上传文件之前的方法
const handleBeforeUpload = (file) => {
    const isJPEG = file.name.split(".")[1] === "jpeg";
    const isJPG = file.name.split(".")[1] === "jpg";
    const isPNG = file.name.split(".")[1] === "png";
    const isWEBP = file.name.split(".")[1] === "webp";
    const isGIF = file.name.split(".")[1] === "gif";
    const isLt4M = file.size / 1024 / 1024 < 4;
    if (!isJPG && !isJPEG && !isPNG && !isWEBP && !isGIF) {
        alert("上传图片只能是 JPEG/JPG/PNG 格式!");
    }
    if (!isLt4M) {
        alert("单张图片大小不能超过 4mb!");
    }
    return (isJPEG || isJPG || isPNG || isWEBP || isGIF) && isLt4M;
}


// 处理文件选择事件
const handleFileChange = (event) => {
    const file = event.target.files[0];
    if (!handleBeforeUpload(file)) {
        return;
    }
    imageSrc.value = URL.createObjectURL(file);
    console.log(imageSrc.value)
}
const uploadHandler = () => {
    const fileInput = document.querySelector('input[type="file"]');
    const file = fileInput.files[0];
    if (file && handleBeforeUpload(file)) {
        const formData = new FormData();
        formData.append("file", file);

        // 发送文件到服务器
        uploadImg(formData)
            .then(response => {
                // 上传成功，更新图片路径
                showMessage("上传成功！")
                childCover.value = response.data.data
                // 使用 $emit 发送事件和数据到父组件
                emit('childData', childCover.value);
                console.log(response)
            })
            .catch(error => {
                showMessage("上传失败！",'warning')
                console.error("文件上传失败", error);
            });
    }
}


</script>
  
<style scoped>
.has-mask {
    /* position: absolute; */
    clip: rect(10px, 150px, 130px, 10px);
}
</style>
  