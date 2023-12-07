package com.howonenew.common.domain.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.howonenew.common.domain.dos.QuestionEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionMapper extends BaseMapper<QuestionEntity> {
    @Select("SELECT q.question_id, q.question_text, q.correct_answer, q.question_type, q.scores, " +
            "GROUP_CONCAT(o.option_text) AS optionTexts, GROUP_CONCAT(o.is_correct) AS isCorrectValues FROM t_questions q " +
            "INNER JOIN t_choice_options o ON q.question_id = o.question_id " +
            "WHERE q.course_id = #{courseId} GROUP BY q.question_id, q.question_text, q.correct_answer, q.question_type, q.scores;")
    List<QuestionEntity> getQuestionEntities(@Param("courseId")Integer courseId);
}
