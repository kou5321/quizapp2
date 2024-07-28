package com.bfs.logindemo.domain;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Contact {
    private int contact_id;
    private String subject;
    private String message;
    private String email;
    private Timestamp time;
}
