package com.bfs.logindemo.service;

import com.bfs.logindemo.dao.UserDao;
import com.bfs.logindemo.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserDao userDao;

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public boolean createNewUser(User user) {
        if (userDao.getUserByEmail(user.getEmail()).isPresent()) {
            return false; // Email already exists
        }
        userDao.createNewUser(user);
        return true;
    }

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    public Optional<User> validateLogin(String email, String password) {
        return userDao.getAllUsers().stream()
                .filter(u -> u.getEmail().equals(email) && u.getPassword().equals(password))
                .findFirst();
    }
}
