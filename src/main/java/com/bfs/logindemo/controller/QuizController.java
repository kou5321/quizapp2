package com.bfs.logindemo.controller;

import com.bfs.logindemo.domain.Choice;
import com.bfs.logindemo.domain.Question;
import com.bfs.logindemo.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
public class QuizController {

    private final QuestionService questionService;

    @Autowired
    public QuizController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @GetMapping("/quiz")
    public String getQuiz(Model model) {
        Question question = questionService.getQuestion();
        List<Choice> choices = questionService.getChoicesForQuestion(question.getQuestion_id());
        model.addAttribute("question", question);
        model.addAttribute("choices", choices);
        return "quiz";
    }

    @PostMapping("/quiz")
    public String submitQuiz(@RequestParam(name = "selectedChoiceId") Integer selectedChoiceId, HttpSession session) {
        session.setAttribute("selectedChoiceId", selectedChoiceId);
        return "redirect:/quiz-result";
    }

    @GetMapping("/quiz-result")
    public String getQuizResult(Model model, HttpSession session) {
        Integer selectedChoiceId = (Integer) session.getAttribute("selectedChoiceId");
        Optional<Choice> selectedChoice = questionService.getChoiceById(selectedChoiceId);

        if (selectedChoice.isPresent()) {
            String result = questionService.checkAnswer(selectedChoice.get());
            model.addAttribute("selectedChoiceDescription", selectedChoice.get().getDescription());
            model.addAttribute("result", result);
        } else {
            model.addAttribute("result", "Invalid choice");
        }
        return "quiz-result";
    }
}
