USE adlister_db;


CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email    VARCHAR(100) NOT NULL,
    password INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE(username, email)

);

CREATE TABLE IF NOT EXISTS ads
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED DEFAULT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL ,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);



