USE employees;

SELECT last_name, first_name FROM employees ORDER BY last_name ASC,first_name ASC,  'Irena','Vidya', 'Maya' ;
SELECT last_name,first_name,emp_no FROM employees WHERE last_name LIKE '%E%' ORDER BY emp_no DESC;
SELECT CONCAT(first_name,' ',last_name)AS 'Full Name' FROM employees WHERE last_name LIKE 'E%E' ORDER BY CONCAT(first_name, ' ',last_name);
SELECT * FROM employees WHERE first_name LIKE '%sus%';
SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
SELECT * FROM employees WHERE birth_date LIKE '%-12-24';
SELECT * FROM employees WHERE last_name LIKE '%q%';

SELECT * FROM employees
WHERE first_name = 'Irena'
   OR first_name = 'Vidya'
   OR first_name = 'Maya';

SELECT * FROM employees
WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
  AND gender = 'M';


SELECT * FROM employees WHERE (last_name LIKE 'E%') OR (last_name LIKE '%E');

SELECT * FROM employees WHERE last_name LIKE 'E%E';

SELECT * FROM employees WHERE birth_date  LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31' ORDER BY  birth_date, hire_date DESC;

SELECT * FROM employees WHERE birth_date  LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '1999-12-31' ORDER BY  birth_date, hire_date DESC LIMIT 5 OFFSET 45;

SELECT CONCAT(first_name, ' ', last_name) AS Name, datediff(curdate(),hire_date) AS 'Years With Company' FROM employees WHERE birth_date AND(hire_date BETWEEN '1990-0-01' AND '1999-12-31') ORDER BY CONCAT(first_name, ' ', last_name);

SELECT * FROM (SELECT * FROM employees WHERE last_name LIKE '%q%') AS t1 WHERE last_name NOT LIKE '%qu%';

