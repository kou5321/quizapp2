package com.bfs.logindemo.dao;

import com.bfs.logindemo.domain.Quiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QuizDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public QuizDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Quiz> getQuizzesByUserId(int userId) {
        String sql = "SELECT * FROM quiz WHERE user_id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Quiz.class), userId);
    }
}
