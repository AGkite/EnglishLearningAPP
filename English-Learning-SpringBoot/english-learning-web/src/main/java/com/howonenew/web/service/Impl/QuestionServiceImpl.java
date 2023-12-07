package com.howonenew.web.service.Impl;

import com.howonenew.common.domain.dos.QuestionEntity;
import com.howonenew.common.domain.mapper.QuestionMapper;
import com.howonenew.web.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Arrays;
@Service
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public List<Map<String, Object>> getQuestions(Integer courseId) {
        return questionMapper.getQuestionEntities(courseId).stream()
                .map(this::mapQuestionEntityToResponse)
                .collect(Collectors.toList());
    }

    private Map<String, Object> mapQuestionEntityToResponse(QuestionEntity questionEntity) {
        Map<String, Object> response = new HashMap<>();
        response.put("question", questionEntity.getQuestionText());
        response.put("scores", questionEntity.getScores());

        // 将true的值设置为正确答案对应的选项
        response.put("true", mapTrueValue(questionEntity));

        // 将option_texts按','拆分为Map对象
        Map<String, String> options = parseOptions(questionEntity.getOptionTexts());
        response.put("option", options);

        return response;
    }

    private String mapTrueValue(QuestionEntity questionEntity) {
        // 在选项中查找正确答案对应的键
        Map<String, String> options = parseOptions(questionEntity.getOptionTexts());
        for (Map.Entry<String, String> entry : options.entrySet()) {
            if (questionEntity.getCorrectAnswer().equals(entry.getValue())) {
                return entry.getKey();
            }
        }
        return null; // 如果找不到匹配的选项，可以返回null或者其他适当的值
    }

    private Map<String, String> parseOptions(String optionTexts) {
        String[] optionArray = optionTexts.split(",");
        List<String> options = Arrays.asList(optionArray);

        Map<String, String> optionMap = new HashMap<>();

        // 这里是简单示例，假设选项的顺序是A、B、C、D
        optionMap.put("A", options.get(0));
        optionMap.put("B", options.get(1));
        optionMap.put("C", options.get(2));
        optionMap.put("D", options.get(3));

        return optionMap;
    }
}

