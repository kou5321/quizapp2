package com.bfs.logindemo.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QuizQuestion {
    private int qq_id;
    private int quiz_id;
    private int question_id;
    private int user_choice_id;
}
