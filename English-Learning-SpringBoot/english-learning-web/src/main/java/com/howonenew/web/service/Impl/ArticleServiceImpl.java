package com.howonenew.web.service.Impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.howonenew.common.domain.dos.ArticleDO;
import com.howonenew.common.domain.mapper.ArticleMapper;
import com.howonenew.common.model.BasePageQuery;
import com.howonenew.common.utils.PageResponse;
import com.howonenew.web.model.ArticlePageListRspVO;
import com.howonenew.web.model.ArticleRspVO;
import com.howonenew.web.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public PageResponse findArticleList(BasePageQuery basePageQuery) {
        // 获取当前页、以及每页需要展示的数据数量
        Long current = basePageQuery.getCurrent();
        Long size = basePageQuery.getSize();

        // 分页对象(查询第几页、每页多少数据)
        Page<ArticleDO> page = new Page<>(current, size);

        Page<ArticleDO> articleDOPage = articleMapper.selectPage(page, null);

        List<ArticleDO> articleDOS = articleDOPage.getRecords();

        List<ArticlePageListRspVO> vos = null;
        if(!CollectionUtils.isEmpty(articleDOS)) {
            vos = articleDOS.stream()
                    .map(articleDO -> ArticlePageListRspVO.builder()
                            .id(articleDO.getArticleId())
                            .title(articleDO.getTitle())
                            .cover(articleDO.getCover())
                            .summary(articleDO.getSummary())
                            .createTime(articleDO.getCreateTime())
                            .build())
                    .collect(Collectors.toList());
        }

        return PageResponse.success(articleDOPage,vos);
    }

    @Override
    public ArticleRspVO getArticle(Integer articleId) {
        ArticleDO articleDO = articleMapper.selectById(articleId);
        String content = articleMapper.getContent(articleId);
        return ArticleRspVO.builder()
                .title(articleDO.getTitle())
                .summary(articleDO.getSummary())
                .cover(articleDO.getCover())
                .createTime(articleDO.getCreateTime())
                .readNum(articleDO.getReadNum())
                .content(content)
                .build();
    }
}
