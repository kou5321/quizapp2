package com.bfs.logindemo.service;

import com.bfs.logindemo.dao.QuizResultDao;
import com.bfs.logindemo.domain.QuizResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizResultService {

    private final QuizResultDao quizResultDao;

    @Autowired
    public QuizResultService(QuizResultDao quizResultDao) {
        this.quizResultDao = quizResultDao;
    }

    public void saveQuizResult(QuizResult quizResult) {
        quizResultDao.saveQuizResult(quizResult);
    }

    public List<QuizResult> getQuizResultsByUserId(int userId) {
        return quizResultDao.getQuizResultsByUserId(userId);
    }
}
