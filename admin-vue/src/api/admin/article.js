import { instance } from "@/axios";

export function addArticle(article) {
    return instance.post('/article/add',article)
}