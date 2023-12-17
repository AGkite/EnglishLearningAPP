package com.howonenew.common.domain.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.howonenew.common.domain.dos.WordDO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WordMapper extends BaseMapper<WordDO> {
    @Select("select w.word_id,w.word,w.pronunciation,w.translate from t_words as w " +
            "inner join t_course_word_relation as c on w.word_id=c.word_id " +
            "where c.course_id=#{courseId} limit 50;")
    List<WordDO> getWords(@Param("courseId") Integer courseId);
}
