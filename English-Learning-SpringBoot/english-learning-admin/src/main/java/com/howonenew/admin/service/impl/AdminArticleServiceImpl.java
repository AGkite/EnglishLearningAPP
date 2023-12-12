package com.howonenew.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.howonenew.admin.model.ArticleRequest;
import com.howonenew.admin.service.AdminArticleService;
import com.howonenew.common.domain.dos.ArticleDO;
import com.howonenew.common.domain.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminArticleServiceImpl implements AdminArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    @Transactional
    public int addArticle(ArticleRequest article) {
        ArticleDO articleDO = ArticleDO.builder()
                .title(article.getTitle())
                .cover(article.getCover())
                .summary(article.getSummary())
                .build();
        //插入文章表
        int i = articleMapper.insert(articleDO);
        if (i>0) {
            LambdaQueryWrapper<ArticleDO> wrapper = new LambdaQueryWrapper<>();
            wrapper.eq(ArticleDO::getTitle,articleDO.getTitle());
            ArticleDO articleDO1 = articleMapper.selectOne(wrapper);
            //插入内容表
            Integer articleId = articleDO1.getArticleId();
            String content = article.getContent();
            articleMapper.addContent(articleId,content);
        }
        return i;
    }
}
