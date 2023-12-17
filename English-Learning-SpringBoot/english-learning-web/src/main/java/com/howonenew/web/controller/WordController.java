package com.howonenew.web.controller;

import com.howonenew.common.domain.dos.WordDO;
import com.howonenew.common.utils.Response;
import com.howonenew.web.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/word")
public class WordController {
    @Autowired
    private WordService wordService;

    @GetMapping("/getWords/{courseId}")
    public Response getWords(@PathVariable("courseId") Integer courseId) {
        List<WordDO> words = wordService.getWords(courseId);
        return Response.success(words);
    }
}
