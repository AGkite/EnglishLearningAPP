package com.howonenew.web.service.Impl;

import com.howonenew.common.domain.dos.WordDO;
import com.howonenew.common.domain.mapper.WordMapper;
import com.howonenew.web.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WordServiceImpl implements WordService {

    @Autowired
    private WordMapper wordMapper;
    @Override
    public List<WordDO> getWords(Integer courseId) {
        return wordMapper.getWords(courseId);
    }
}
