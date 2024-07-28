package com.bfs.logindemo.service;

import com.bfs.logindemo.dao.QuizDao;
import com.bfs.logindemo.domain.Quiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {

    private final QuizDao quizDao;

    @Autowired
    public QuizService(QuizDao quizDao) {
        this.quizDao = quizDao;
    }

    public List<Quiz> getQuizzesByUserId(int userId) {
        return quizDao.getQuizzesByUserId(userId);
    }
}
