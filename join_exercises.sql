USE join_test_db;

CREATE DATABASE IF NOT EXISTS join_test_db;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);


INSERT INTO users (name, email, role_id) VALUES
('Andy', 'andy@example.com',Null),
('Uski', 'uski@example.com', 2),
('Richard', 'richard@example.com', 3),
('Sonny', 'sonny@example.com', 3);


SELECT users.name as user_name, roles.name as role_name FROM users LEFT JOIN roles ON users.role_id = roles.id;
SELECT users.name as user_name, roles.name as role_name FROM users RIGHT JOIN roles ON users.role_id = roles.id;

SELECT r.name AS role, COUNT(*) AS role_count FROM roles AS r
JOIN users AS u ON r.id = u.role_id
GROUP BY r.name ORDER BY 2 DESC;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;