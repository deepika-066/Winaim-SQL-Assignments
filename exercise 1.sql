CREATE TABLE employees(
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(10) NOT NULL,
last_name VARCHAR(10) NOT NULL,
department_id INT,
hire_date DATE 
);

CREATE TABLE departments(
department_id INT AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(50) NOT NULL
);

CREATE TABLE salaries(
employee_id INT ,
salary DECIMAL(10, 2),
from_date DATE,
to_date DATE,
PRIMARY KEY (employee_id, from_date),
FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Managment');

INSERT INTO employees (employee_id, first_name, last_name, department_id, hire_date) VALUES
(101, 'John', 'Doe', 1, '2021-05-15'),
(102, 'Richard', 'Newman', 2, '2022-03-23'),
(103, 'Emily', 'Davis', 3, '2023-07-30');

INSERT INTO salaries (employee_id, salary, from_date, to_date) VALUES
(101, 50000, '2021-05-15', '2022-05-15'),
(102, 70000, '2022-03-23', '2023-03-23'),
(103, 80000, '2023-07-30', '2024-07-30' );
 
 SELECT * FROM employees WHERE hire_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR);

SELECT d.department_name, SUM(s.salary) AS total_expenditure
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name; 

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
JOIN departments d ON e.department_id = d.department_id
ORDER BY s.salary DESC
LIMIT 5;


 


