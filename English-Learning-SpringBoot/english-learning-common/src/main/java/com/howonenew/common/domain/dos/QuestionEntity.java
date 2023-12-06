package com.howonenew.common.domain.dos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QuestionEntity {
    private Long questionId;
    private String questionText;
    private String correctAnswer;
    private String questionType;
    private int scores;
    private String optionTexts;
    private String isCorrectValues;
}
