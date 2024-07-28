package com.bfs.logindemo.service;

import com.bfs.logindemo.dao.QuestionDao;
import com.bfs.logindemo.domain.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {

    private final QuestionDao questionDao;

    @Autowired
    public QuestionService(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public List<Question> getQuestionsByCategoryId(int categoryId) {
        return questionDao.getQuestionsByCategoryId(categoryId);
    }
}
