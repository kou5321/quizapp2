package com.bfs.logindemo.dao;

import com.bfs.logindemo.domain.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QuestionDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public QuestionDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Question> getQuestionsByCategoryId(int categoryId) {
        String sql = "SELECT * FROM question WHERE category_id = ? AND is_active = TRUE";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Question.class), categoryId);
    }

    public Question getQuestionById(int questionId) {
        String sql = "SELECT * FROM question WHERE question_id = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Question.class), questionId);
    }
}
