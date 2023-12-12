package com.howonenew.common.domain.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.howonenew.common.domain.dos.ArticleDO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface ArticleMapper extends BaseMapper<ArticleDO> {
    @Select("select content from t_article_content where article_id = #{articleId};")
    String getContent(@Param("articleId") Integer articleId);

    @Insert("INSERT INTO t_article_content(article_id,content) VALUES (#{articleId},#{content})")
    int addContent(@Param("articleId") Integer article,@Param("content") String content);
}
