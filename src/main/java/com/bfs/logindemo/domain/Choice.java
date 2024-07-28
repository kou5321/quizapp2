package com.bfs.logindemo.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Choice {
    private int choice_id;
    private String description;
    private boolean is_correct;

    public boolean isCorrect() {
        return is_correct;
    }
}
