package com.bfs.logindemo.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class QuizResult {
    private int result_id;
    private int user_id;
    private int quiz_id;
    private int question_id;
    private int selected_choice_id;
    private boolean is_correct;

    // Optional additional fields for display purposes
    private String questionContent;
    private String userSelectedOption;
    private List<Choice> options;

    // Add constructor for database mapping
    public QuizResult(int user_id, int quiz_id, int question_id, int selected_choice_id, boolean is_correct) {
        this.user_id = user_id;
        this.quiz_id = quiz_id;
        this.question_id = question_id;
        this.selected_choice_id = selected_choice_id;
        this.is_correct = is_correct;
    }

    public boolean isCorrect() {
        return is_correct;
    }
}
