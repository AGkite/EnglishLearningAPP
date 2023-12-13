package com.howonenew.web.service;

import com.howonenew.common.model.BasePageQuery;
import com.howonenew.common.utils.PageResponse;
import com.howonenew.web.model.ArticlePageListRspVO;

public interface ArticleService {
    PageResponse findArticleList(BasePageQuery basePageQuery);
}
