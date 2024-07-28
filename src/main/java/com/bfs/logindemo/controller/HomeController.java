package com.bfs.logindemo.controller;

import com.bfs.logindemo.domain.Category;
import com.bfs.logindemo.domain.Quiz;
import com.bfs.logindemo.service.CategoryService;
import com.bfs.logindemo.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HomeController {

    private final CategoryService categoryService;
    private final QuizService quizService;

    @Autowired
    public HomeController(CategoryService categoryService, QuizService quizService) {
        this.categoryService = categoryService;
        this.quizService = quizService;
    }

    @GetMapping("/home")
    public String getHome(Model model, HttpSession session) {
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);

        // Assuming user_id is stored in the session
        int userId = (int) session.getAttribute("user_id");
        List<Quiz> quizzes = quizService.getQuizzesByUserId(userId);
        model.addAttribute("quizzes", quizzes);

        return "home";
    }
}
