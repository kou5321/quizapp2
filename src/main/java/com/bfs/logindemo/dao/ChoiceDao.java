package com.bfs.logindemo.dao;

import com.bfs.logindemo.domain.Choice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ChoiceDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ChoiceDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Choice> getChoicesByQuestionId(int questionId) {
        String sql = "SELECT * FROM choice WHERE question_id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Choice.class), questionId);
    }
}
