package com.bfs.logindemo.domain;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Quiz {
    private int quiz_id;
    private int user_id;
    private int category_id;
    private String name;
    private Timestamp time_start;
    private Timestamp time_end;
}
