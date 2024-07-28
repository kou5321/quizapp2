package com.bfs.logindemo.controller;

import com.bfs.logindemo.domain.Choice;
import com.bfs.logindemo.domain.Question;
import com.bfs.logindemo.service.ChoiceService;
import com.bfs.logindemo.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
public class QuizController {

    private final QuestionService questionService;
    private final ChoiceService choiceService;

    @Autowired
    public QuizController(QuestionService questionService, ChoiceService choiceService) {
        this.questionService = questionService;
        this.choiceService = choiceService;
    }

    @GetMapping("/quiz")
    public String getQuiz(@RequestParam int categoryId, Model model, HttpSession session) {
        System.out.println("categoryId: " + categoryId); // Debugging statement
        List<Question> questions = questionService.getQuestionsByCategoryId(categoryId);
        Collections.shuffle(questions);
        if (questions.size() > 5) {
            questions = questions.subList(0, 5);
        }

        for (Question question : questions) {
            List<Choice> choices = choiceService.getChoicesByQuestionId(question.getQuestion_id());
            question.setChoices(choices);
        }

        model.addAttribute("questions", questions);
        return "quiz";
    }

    @PostMapping("/quiz")
    public String submitQuiz(@RequestParam List<Integer> selectedChoices, HttpSession session) {
        // Logic to handle quiz submission
        // Save user answers and calculate the score

        return "redirect:/quiz-result";
    }
}
