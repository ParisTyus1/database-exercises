CREATE TABLE IF NOT EXISTS users (
                                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                     email VARCHAR(60),
                                     password VARCHAR(255),
                                     PRIMARY KEY (id),
                                     CONSTRAINT uc_email UNIQUE (email)
);
CREATE TABLE IF NOT EXISTS ads (
                                   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                   title VARCHAR(60),
                                   description VARCHAR(255),
                                   category VARCHAR(20),
                                   user_id INT,
                                   PRIMARY KEY (id),
                                   FOREIGN KEY (user_id) REFERENCES users (id)
);
CREATE TABLE IF NOT EXISTS categories (
                                          id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                          category VARCHAR(20),
                                          user_id INT,
                                          PRIMARY KEY (id),
                                          FOREIGN KEY (user_id) REFERENCES users (id)
);
CREATE TABLE IF NOT EXISTS category_ads (
                                            category_id INT,
                                            ads_id INT,
                                            FOREIGN KEY (category_id) REFERENCES categories (id),
                                            FOREIGN KEY (ads_id) REFERENCES users (id)
);
# for a given ad, what is the email address of the user that created it
SELECT email FROM ads
                      JOIN users ON users.id = ads.user_id;
# for a given ad, what category or categories does it belong to?
SELECT category FROM ads AS a
                         JOIN category_ads AS ca ON a.id = ca.ads_id
                         JOIN categories AS cat ON ca.category_id = cat.id;
# for a given category, show all the ads that are in that category
SELECT title FROM categories AS cat
                      JOIN category_ads AS ca ON cat.id = ca.category_id
                      JOIN ads ON ca.ads_id = ads.id;
# for a given user, show all the ads they have posted
SELECT title, description FROM users
                                   JOIN ads ON users.id = ads.user_id
WHERE users.id = 5;
# questions
# answer choices
# grades
CREATE TABLE IF NOT EXISTS quiz (
                                    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                    title VARCHAR(40),
                                    subject VARCHAR(20),
                                    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS questions (
                                         id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                         text TEXT,
                                         quiz_id INT,
                                         PRIMARY KEY (id),
                                         FOREIGN KEY (quiz_id) REFERENCES quiz (id)
);
CREATE TABLE IF NOT EXISTS answers (
                                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                       text TEXT,
                                       correct CHAR, -- for (T/F)
                                       question_id INT,
                                       checked CHAR,
                                       PRIMARY KEY (id),
                                       FOREIGN KEY (question_id) REFERENCES questions (id)
);
CREATE TABLE IF NOT EXISTS users (
                                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                     role CHAR NOT NULL, -- a for admin, s for student
                                     username VARCHAR(20) NOT NULL,
                                     password VARCHAR(255) NOT NULL,
                                     PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS results (
                                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                                       score FLOAT,
                                       users_id INT,
                                       quizzes_id INT,
                                       PRIMARY KEY (id),
                                       FOREIGN KEY (users_id) REFERENCES users (id),
                                       FOREIGN KEY (quizzes_id) REFERENCES quiz (id)
);
SELECT COUNT(*) AS 'Number of students that have taken the quiz' FROM (
                                                                          SELECT DISTINCT users_id
                                                                          FROM results
                                                                                   JOIN quiz AS q ON q.id = results.quizzes_id AND q.id = 5
                                                                          GROUP BY users_id
                                                                      )