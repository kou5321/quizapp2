package com.bfs.logindemo.dao;

import com.bfs.logindemo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public class UserDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void createNewUser(User user) {
        String sql = "INSERT INTO user (email, password, firstname, lastname, is_active, is_admin) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, user.getEmail(), user.getPassword(), user.getFirstname(), user.getLastname(), user.is_active(), user.is_admin());
    }

    public List<User> getAllUsers() {
        String sql = "SELECT * FROM user";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    public Optional<User> getUserByEmail(String email) {
        String sql = "SELECT * FROM user WHERE email = ?";
        List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class), email);
        return users.stream().findFirst();
    }
}
