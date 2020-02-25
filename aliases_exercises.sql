USE employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees
LIMIT 25;
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY full_name
LIMIT 25;

SELECT CONCAT(last_name,' ',first_name)AS 'Full Name', CONCAT(birth_date)AS 'DOB' FROM employees  limit 10;


# joining databases
SELECT author, content
from authors WHERE author = "sam Jones"
JOIN quotes On quotes.author_id = authors.id
WHEN len(quotes.content) < 255;

SELECT author,content