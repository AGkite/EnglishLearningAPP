import { instance } from "@/axios";

export function uploadImg(formData) {
    return instance.post("/file/upload", formData)
}