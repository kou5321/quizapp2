package com.bfs.logindemo.domain;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Question {
    private int question_id;
    private int category_id;
    private String description;
    private boolean is_active;
    private List<Choice> choices;
}