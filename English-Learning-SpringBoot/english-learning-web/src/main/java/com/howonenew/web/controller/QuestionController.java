package com.howonenew.web.controller;

import com.howonenew.common.aspect.ApiOperationLog;
import com.howonenew.web.service.QuestionService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/questions")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @ApiOperationLog(description = "获取问题")
    @ApiOperation("获取问题")
    @GetMapping("/getQuestions/{courseId}")
    public List<Map<String, Object>> getQuestions(@PathVariable Integer courseId) {
        return questionService.getQuestions(courseId);
    }
}
