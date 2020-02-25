USE employees;
SELECT * FROM titles;
SELECT DISTINCT title FROM titles;
SELECT first_name FROM employees GROUP BY first_name;

SELECT last_name FROM employees WHERE last_name LIKE 'E%E' GROUP BY last_name;
SELECT first_name,last_name FROM employees WHERE last_name LIKE 'E%E' GROUP BY first_name, last_name;

SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

SELECT DISTINCT last_name, COUNT(*) AS Count FROM employees WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';

Select COUNT(*), gender FROM employees WHERE first_name IN ('Irene', 'Vidya', 'Maya') GROUP BY 2;

