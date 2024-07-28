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

INSERT INTO category (name) VALUES ('Software Development');
INSERT INTO category (name) VALUES ('Data Science');
INSERT INTO category (name) VALUES ('Business Analytics');

-- Ensure these are inserted correctly and you have the correct quiz_id values
INSERT INTO quiz (name, time_start, time_end, user_id, category_id) VALUES
                                                                        ('Software Development Quiz 1', '2024-07-27 10:00:00', '2024-07-27 10:30:00', 1, 1),
                                                                        ('Data Science Quiz 1', '2024-07-27 11:00:00', '2024-07-27 11:30:00', 1, 2),
                                                                        ('Business Analytics Quiz 1', '2024-07-27 12:00:00', '2024-07-27 12:30:00', 1, 3);


-- Software Development Questions
INSERT INTO question (description, is_active, category_id) VALUES
                                                               ('What is polymorphism in OOP?', TRUE, 1),
                                                               ('What is inheritance in OOP?', TRUE, 1),
                                                               ('What is encapsulation in OOP?', TRUE, 1),
                                                               ('What is abstraction in OOP?', TRUE, 1),
                                                               ('What is a constructor in Java?', TRUE, 1),
                                                               ('What is the difference between an interface and an abstract class?', TRUE, 1),
                                                               ('Explain the concept of a Java Virtual Machine (JVM).', TRUE, 1);

-- Data Science Questions
INSERT INTO question (description, is_active, category_id) VALUES
                                                               ('What is overfitting in machine learning?', TRUE, 2),
                                                               ('What is underfitting in machine learning?', TRUE, 2),
                                                               ('Explain the difference between supervised and unsupervised learning.', TRUE, 2),
                                                               ('What is a confusion matrix?', TRUE, 2),
                                                               ('What is the purpose of cross-validation?', TRUE, 2),
                                                               ('What is the bias-variance tradeoff?', TRUE, 2),
                                                               ('Explain the concept of gradient descent.', TRUE, 2);

-- Business Analytics Questions
INSERT INTO question (description, is_active, category_id) VALUES
                                                               ('What is a SWOT analysis?', TRUE, 3),
                                                               ('Explain the concept of ROI.', TRUE, 3),
                                                               ('What is a KPI?', TRUE, 3),
                                                               ('What is the difference between qualitative and quantitative data?', TRUE, 3),
                                                               ('Explain the concept of a balanced scorecard.', TRUE, 3),
                                                               ('What is data mining?', TRUE, 3),
                                                               ('Explain the concept of predictive analytics.', TRUE, 3);

-- Choices for question 1
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The ability of a variable, function or object to take on multiple forms.', TRUE, 1),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 1),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 1),
                                                              ('The concept of hiding the implementation details.', FALSE, 1);

-- Choices for question 2
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The mechanism of basing an object or class upon another object or class.', TRUE, 2),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 2),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 2),
                                                              ('The concept of hiding the implementation details.', FALSE, 2);

-- Choices for question 3
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The bundling of data with the methods that operate on that data.', TRUE, 3),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 3),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 3),
                                                              ('The concept of hiding the implementation details.', FALSE, 3);

-- Choices for question 4
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The concept of hiding the implementation details.', TRUE, 4),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 4),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 4),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 4);

-- Choices for question 5
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A special method that is used to initialize objects.', TRUE, 5),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 5),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 5),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 5);

-- Choices for question 6
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('An interface defines a contract, an abstract class is a base class.', TRUE, 6),
                                                              ('A special method that is used to initialize objects.', FALSE, 6),
                                                              ('The concept of hiding the implementation details.', FALSE, 6),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 6);

-- Choices for question 7
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A software-based mechanism that runs Java applications.', TRUE, 7),
                                                              ('A special method that is used to initialize objects.', FALSE, 7),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 7),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 7);

-- Choices for question 1
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The ability of a variable, function or object to take on multiple forms.', TRUE, 1),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 1),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 1),
                                                              ('The concept of hiding the implementation details.', FALSE, 1);

-- Choices for question 2
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The mechanism of basing an object or class upon another object or class.', TRUE, 2),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 2),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 2),
                                                              ('The concept of hiding the implementation details.', FALSE, 2);

-- Choices for question 3
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The bundling of data with the methods that operate on that data.', TRUE, 3),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 3),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 3),
                                                              ('The concept of hiding the implementation details.', FALSE, 3);

-- Choices for question 4
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The concept of hiding the implementation details.', TRUE, 4),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 4),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 4),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 4);

-- Choices for question 5
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A special method that is used to initialize objects.', TRUE, 5),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 5),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 5),
                                                              ('The bundling of data with the methods that operate on that data.', FALSE, 5);

-- Choices for question 6
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('An interface defines a contract, an abstract class is a base class.', TRUE, 6),
                                                              ('A special method that is used to initialize objects.', FALSE, 6),
                                                              ('The concept of hiding the implementation details.', FALSE, 6),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 6);

-- Choices for question 7
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A software-based mechanism that runs Java applications.', TRUE, 7),
                                                              ('A special method that is used to initialize objects.', FALSE, 7),
                                                              ('The ability of a variable, function or object to take on multiple forms.', FALSE, 7),
                                                              ('The mechanism of basing an object or class upon another object or class.', FALSE, 7);
-- Choices for question 8
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A situation where a model learns the training data too well.', TRUE, 8),
                                                              ('A situation where a model fails to learn the training data.', FALSE, 8),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 8),
                                                              ('A measure of how well the model performs.', FALSE, 8);

-- Choices for question 9
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A situation where a model fails to learn the training data.', TRUE, 9),
                                                              ('A situation where a model learns the training data too well.', FALSE, 9),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 9),
                                                              ('A measure of how well the model performs.', FALSE, 9);

-- Choices for question 10
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('Supervised learning uses labeled data, unsupervised learning uses unlabeled data.', TRUE, 10),
                                                              ('A situation where a model learns the training data too well.', FALSE, 10),
                                                              ('A situation where a model fails to learn the training data.', FALSE, 10),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 10);

-- Choices for question 11
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A table that is used to evaluate the performance of a classification model.', TRUE, 11),
                                                              ('A situation where a model learns the training data too well.', FALSE, 11),
                                                              ('A situation where a model fails to learn the training data.', FALSE, 11),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 11);

-- Choices for question 12
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A technique used to assess the performance of a model by partitioning data.', TRUE, 12),
                                                              ('A situation where a model learns the training data too well.', FALSE, 12),
                                                              ('A situation where a model fails to learn the training data.', FALSE, 12),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 12);

-- Choices for question 13
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A tradeoff between model complexity and its ability to generalize.', TRUE, 13),
                                                              ('A situation where a model learns the training data too well.', FALSE, 13),
                                                              ('A situation where a model fails to learn the training data.', FALSE, 13),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 13);

-- Choices for question 14
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('An optimization algorithm to minimize the error in machine learning.', TRUE, 14),
                                                              ('A situation where a model learns the training data too well.', FALSE, 14),
                                                              ('A situation where a model fails to learn the training data.', FALSE, 14),
                                                              ('A method used to reduce the complexity of a model.', FALSE, 14);




-- Choices for question 15
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A strategic planning technique to identify strengths, weaknesses, opportunities, and threats.', TRUE, 15),
                                                              ('A measure of financial return.', FALSE, 15),
                                                              ('A performance measurement tool.', FALSE, 15),
                                                              ('A method used to analyze data.', FALSE, 15);

-- Choices for question 16
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('Return on Investment, a measure of financial return.', TRUE, 16),
                                                              ('A strategic planning technique to identify strengths, weaknesses, opportunities, and threats.', FALSE, 16),
                                                              ('A performance measurement tool.', FALSE, 16),
                                                              ('A method used to analyze data.', FALSE, 16);

-- Choices for question 17
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('Key Performance Indicator, a measure of performance.', TRUE, 17),
                                                              ('Return on Investment, a measure of financial return.', FALSE, 17),
                                                              ('A strategic planning technique to identify strengths, weaknesses, opportunities, and threats.', FALSE, 17),
                                                              ('A method used to analyze data.', FALSE, 17);

-- Choices for question 18
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('Qualitative data is descriptive, quantitative data is numerical.', TRUE, 18),
                                                              ('Key Performance Indicator, a measure of performance.', FALSE, 18),
                                                              ('Return on Investment, a measure of financial return.', FALSE, 18),
                                                              ('A strategic planning technique to identify strengths, weaknesses, opportunities, and threats.', FALSE, 18);

-- Choices for question 19
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('A performance measurement tool that includes financial and non-financial metrics.', TRUE, 19),
                                                              ('Qualitative data is descriptive, quantitative data is numerical.', FALSE, 19),
                                                              ('Key Performance Indicator, a measure of performance.', FALSE, 19),
                                                              ('Return on Investment, a measure of financial return.', FALSE, 19);

-- Choices for question 20
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The process of discovering patterns in large data sets.', TRUE, 20),
                                                              ('A performance measurement tool that includes financial and non-financial metrics.', FALSE, 20),
                                                              ('Qualitative data is descriptive, quantitative data is numerical.', FALSE, 20),
                                                              ('Key Performance Indicator, a measure of performance.', FALSE, 20);

-- Choices for question 21
INSERT INTO choice (description, is_correct, question_id) VALUES
                                                              ('The use of data, statistical algorithms, and machine learning techniques to identify the likelihood of future outcomes.', TRUE, 21),
                                                              ('The process of discovering patterns in large data sets.', FALSE, 21),
                                                              ('A performance measurement tool that includes financial and non-financial metrics.', FALSE, 21),
                                                              ('Qualitative data is descriptive, quantitative data is numerical.', FALSE, 21);
-- Mapping questions to Software Development Quiz 1
INSERT INTO quizquestion (quiz_id, question_id) VALUES
                                                    (1, 1),
                                                    (1, 2),
                                                    (1, 3),
                                                    (1, 4),
                                                    (1, 5);

-- Mapping questions to Data Science Quiz 1
INSERT INTO quizquestion (quiz_id, question_id) VALUES
                                                    (2, 8),
                                                    (2, 9),
                                                    (2, 10),
                                                    (2, 11),
                                                    (2, 12);

-- Mapping questions to Business Analytics Quiz 1
INSERT INTO quizquestion (quiz_id, question_id) VALUES
                                                    (3, 15),
                                                    (3, 16),
                                                    (3, 17),
                                                    (3, 18),
                                                    (3, 19);

CREATE TABLE quiz_result (
                             result_id INT AUTO_INCREMENT PRIMARY KEY,
                             user_id INT,
                             quiz_id INT,
                             question_id INT,
                             selected_choice_id INT,
                             is_correct BOOLEAN,
                             question_content TEXT,
                             user_selected_option TEXT,
                             correct_option TEXT,
                             FOREIGN KEY (user_id) REFERENCES user(user_id),
                             FOREIGN KEY (quiz_id) REFERENCES quiz(quiz_id),
                             FOREIGN KEY (question_id) REFERENCES question(question_id),
                             FOREIGN KEY (selected_choice_id) REFERENCES choice(choice_id)
);
