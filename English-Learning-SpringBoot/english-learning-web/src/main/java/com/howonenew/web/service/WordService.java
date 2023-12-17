package com.howonenew.web.service;

import com.howonenew.common.domain.dos.WordDO;
import io.swagger.models.auth.In;

import java.util.List;

public interface WordService {
    List<WordDO> getWords(Integer courseId);
}
