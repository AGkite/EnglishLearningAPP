package com.howonenew.admin.controller;

import com.howonenew.admin.model.ArticleRequest;
import com.howonenew.admin.service.AdminArticleService;
import com.howonenew.common.domain.dos.ArticleDO;
import com.howonenew.common.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/article")
public class AdminArticleController {
    @Autowired
    private AdminArticleService adminArticleService;

    @PostMapping("/add")
    public Response addArticle(@RequestBody ArticleRequest article) {
        System.out.println(article);
        int i = adminArticleService.addArticle(article);
        if (i>0) {
            return Response.success("添加文章成功！");
        }
        return Response.fail("添加文章失败！");
    }
}
