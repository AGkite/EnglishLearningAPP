package com.howonenew.admin.service;

import com.howonenew.admin.model.ArticleRequest;
import com.howonenew.common.domain.dos.ArticleDO;

public interface AdminArticleService {
    int addArticle(ArticleRequest article);
}
