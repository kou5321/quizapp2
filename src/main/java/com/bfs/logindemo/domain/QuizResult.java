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
    private String question_content; // New field for question content
    private String user_selected_option; // New field for user selected option
    private String correct_option; // New field for correct option

    // Optional additional fields for display purposes
    private List<Choice> options;

    public QuizResult(int user_id, int quiz_id, int question_id, int selected_choice_id, boolean is_correct, String question_content, String user_selected_option, String correct_option) {
        this.user_id = user_id;
        this.quiz_id = quiz_id;
        this.question_id = question_id;
        this.selected_choice_id = selected_choice_id;
        this.is_correct = is_correct;
        this.question_content = question_content;
        this.user_selected_option = user_selected_option;
        this.correct_option = correct_option;
    }

    public boolean isCorrect() {
        return is_correct;
    }
}
