package com.bfs.logindemo.dao;

import com.bfs.logindemo.domain.QuizResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QuizResultDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public QuizResultDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void saveQuizResult(QuizResult quizResult) {
        String sql = "INSERT INTO quiz_result (user_id, quiz_id, question_id, selected_choice_id, is_correct) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, quizResult.getUser_id(), quizResult.getQuiz_id(), quizResult.getQuestion_id(), quizResult.getSelected_choice_id(), quizResult.is_correct());
    }

    public List<QuizResult> getQuizResultsByUserId(int userId) {
        String sql = "SELECT * FROM quiz_result WHERE user_id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(QuizResult.class), userId);
    }
}
