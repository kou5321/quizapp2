package com.bfs.logindemo.service;

import com.bfs.logindemo.dao.QuestionDao;
import com.bfs.logindemo.domain.Choice;
import com.bfs.logindemo.domain.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuestionService {
    private final QuestionDao questionDao;

    @Autowired
    public QuestionService(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public Question getQuestion() {
        return questionDao.getQuestion();
    }

    public List<Choice> getChoicesForQuestion(int questionId) {
        return questionDao.getChoicesForQuestion(questionId);
    }

    public String checkAnswer(Choice selectedChoice) {
        Question question = questionDao.getQuestion();
        List<Choice> choices = questionDao.getChoicesForQuestion(question.getQuestion_id());
        Choice correctChoice = choices.stream()
                .filter(Choice::is_correct)
                .findFirst()
                .orElse(null);

        return selectedChoice.equals(correctChoice) ? "Correct!" : "Incorrect";
    }

    public Optional<Choice> getChoiceById(Integer selectedChoiceId) {
        return Optional.ofNullable(questionDao.getChoiceById(selectedChoiceId));
    }
}
