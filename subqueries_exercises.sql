USE employees;
# SELECT column_a, column_b, column_c
# FROM table_a
# WHERE column_a IN (
#     SELECT column_a
#     FROM table_b
#     WHERE column_b = true
# );
# 1. Find all the employees with the same hire date as employee 101010 using a subquery.
#69 Rows
SELECT CONCAT(first_name, ' ', last_name) AS employee_name, emp_no AS employee_number
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
);
# 2. Find all the titles held by all employees with the first name Aamod.
# 314 total titles, 6 unique titles
SELECT title AS 'Title'
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);
# 3. Find all the current department managers that are female.
# +------------+------------+
# | first_name | last_name  |
# +------------+------------+
# | Isamu      | Legleitner |
# | Karsten    | Sigstam    |
# | Leon       | DasSarma   |
# | Hilary     | Kambil     |
# +------------+------------+
SELECT CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees
WHERE gender = 'F'
  AND emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
);