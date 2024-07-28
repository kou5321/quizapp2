package com.bfs.logindemo.controller;

import com.bfs.logindemo.domain.Choice;
import com.bfs.logindemo.domain.Question;
import com.bfs.logindemo.domain.QuizResult;
import com.bfs.logindemo.domain.User;
import com.bfs.logindemo.service.ChoiceService;
import com.bfs.logindemo.service.QuestionService;
import com.bfs.logindemo.service.QuizResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class QuizController {

    private final QuestionService questionService;
    private final ChoiceService choiceService;
    private final QuizResultService quizResultService;

    @Autowired
    public QuizController(QuestionService questionService, ChoiceService choiceService, QuizResultService quizResultService) {
        this.questionService = questionService;
        this.choiceService = choiceService;
        this.quizResultService = quizResultService;
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
    public String submitQuiz(@RequestParam Map<String, String> selectedChoices, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        int correctAnswers = 0;
        List<QuizResult> results = new ArrayList<>();

        for (Map.Entry<String, String> entry : selectedChoices.entrySet()) {
            int questionId = Integer.parseInt(entry.getKey().split("_")[1]);
            int selectedChoiceId = Integer.parseInt(entry.getValue());
            Choice selectedChoice = choiceService.getChoiceById(selectedChoiceId);
            Question question = questionService.getQuestionById(questionId);
            boolean isCorrect = selectedChoice.isCorrect();
            if (isCorrect) correctAnswers++;

            QuizResult quizResult = new QuizResult(user.getUser_id(), 1, questionId, selectedChoiceId, isCorrect); // Replace 1 with actual quiz ID
            quizResult.setQuestionContent(question.getDescription());
            quizResult.setUserSelectedOption(selectedChoice.getDescription());
            quizResult.setOptions(question.getChoices());
            results.add(quizResult);

            // Save each quiz result
            quizResultService.saveQuizResult(quizResult);
        }

        boolean passed = correctAnswers > 3;

        model.addAttribute("quizName", "Quiz Name"); // Replace with actual quiz name
        model.addAttribute("userFullName", user.getFirstname() + " " + user.getLastname());
        model.addAttribute("quizStartTime", "Start Time"); // Replace with actual start time
        model.addAttribute("quizEndTime", "End Time"); // Replace with actual end time
        model.addAttribute("result", passed ? "Passed" : "Failed");
        model.addAttribute("results", results);

        return "quiz-result";
    }
}
