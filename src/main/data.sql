CREATE TABLE user (
                      user_id INT AUTO_INCREMENT PRIMARY KEY,
                      email VARCHAR(255) NOT NULL UNIQUE,
                      password VARCHAR(255) NOT NULL,
                      firstname VARCHAR(255),
                      lastname VARCHAR(255),
                      is_active BOOLEAN DEFAULT TRUE,
                      is_admin BOOLEAN DEFAULT FALSE
);

CREATE TABLE category (
                          category_id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL
);

CREATE TABLE question (
                          question_id INT AUTO_INCREMENT PRIMARY KEY,
                          description TEXT NOT NULL,
                          is_active BOOLEAN DEFAULT TRUE,
                          category_id INT,
                          FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE choice (
                        choice_id INT AUTO_INCREMENT PRIMARY KEY,
                        description TEXT NOT NULL,
                        is_correct BOOLEAN DEFAULT FALSE,
                        question_id INT,
                        FOREIGN KEY (question_id) REFERENCES question(question_id)
);

CREATE TABLE quiz (
                      quiz_id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(255) NOT NULL,
                      time_start TIMESTAMP,
                      time_end TIMESTAMP,
                      user_id INT,
                      category_id INT,
                      FOREIGN KEY (user_id) REFERENCES user(user_id),
                      FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE quizquestion (
                              qq_id INT AUTO_INCREMENT PRIMARY KEY,
                              quiz_id INT,
                              question_id INT,
                              user_choice_id INT,
                              FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id),
                              FOREIGN KEY (question_id) REFERENCES question(question_id),
                              FOREIGN KEY (user_choice_id) REFERENCES choice(choice_id)
);

CREATE TABLE contact (
                         contact_id INT AUTO_INCREMENT PRIMARY KEY,
                         subject VARCHAR(255) NOT NULL,
                         message TEXT NOT NULL,
                         email VARCHAR(255) NOT NULL,
                         time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
