package com.howonenew.web.controller;

import com.howonenew.admin.model.ArticleRequest;
import com.howonenew.common.aspect.ApiOperationLog;
import com.howonenew.common.model.BasePageQuery;
import com.howonenew.common.utils.PageResponse;
import com.howonenew.common.utils.Response;
import com.howonenew.web.model.ArticleRspVO;
import com.howonenew.web.service.ArticleService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;

    @PostMapping("/getArticleList")
    @ApiOperation(value = "文章分页数据获取")
    @ApiOperationLog(description = "文章分页数据获取")
    public PageResponse findArticleList(@RequestBody @Validated BasePageQuery basePageQuery) {
        return articleService.findArticleList(basePageQuery);
    }

    @GetMapping("/getArticle/{articleId}")
    @ApiOperation(value = "文章数据获取")
    @ApiOperationLog(description = "文章数据获取")
    public Response getArticle(@PathVariable("articleId") Integer articleId) {
        ArticleRspVO article = articleService.getArticle(articleId);
        return Response.success(article);
    }


}
