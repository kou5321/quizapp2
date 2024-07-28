package com.bfs.logindemo.dao;

import com.bfs.logindemo.domain.Choice;
import com.bfs.logindemo.domain.Question;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class QuestionDao {
    private static final List<Question> questions;
    private static final List<Choice> choices;

    static {
        questions = new ArrayList<>();
        questions.add(new Question(1, 1, "What is the correct answer?", true));

        choices = new ArrayList<>();
        choices.add(new Choice(1, 1, "42", false));
        choices.add(new Choice(2, 1, "correct answer", true));
        choices.add(new Choice(3, 1, "yes", false));
    }

    public Question getQuestion() {
        return questions.get(0); // For simplicity, returning the first question
    }

    public List<Choice> getChoicesForQuestion(int questionId) {
        return choices.stream()
                .filter(choice -> choice.getQuestion_id() == questionId)
                .collect(Collectors.toList());
    }

    public Choice getChoiceById(int choiceId) {
        return choices.stream()
                .filter(choice -> choice.getChoice_id() == choiceId)
                .findFirst()
                .orElse(null);
    }
}
