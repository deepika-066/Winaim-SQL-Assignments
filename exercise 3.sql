CREATE TABLE professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);


CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id)
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    enrollment_date DATE
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (first_name,last_name,enrollment_date) VALUES
('Bob', 'Rao=','2023-09-10'),
('Cathy', 'Smith', '2023-09-10'),
('Alice','Sam','2023-09-10');

INSERT INTO courses(course_id,course_name) VALUES
(095,'Maths'),
(072,'Science'),
(085,'Computer Business');

INSERT INTO enrollments(student_id,course_id,grade) VALUES
(101, 1, 'A'),
(101,2,'B'),
(102,1,'B'),
(102,3,'A'),
(103,1,'C'),
(103,2,'B'),
(103,3,'A');

INSERT INTO professors(first_name,last_name,department) VALUES
('John','Doe','Computer Science'),
('Jane','Smith','Chemistry'),
('Frankin','Rao','Physics');

SELECT c.course_id, c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT c.course_id, c.course_name
FROM courses c
INNER JOIN professors p ON c.professor_id = p.professor_id
WHERE p.department = 'Computer Science';

SELECT c.course_id, c.course_name, 
AVG(e.grade) AS average_grade
FROM courses c
INNER JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT s.student_id, s.first_name, s.last_name, 
COUNT(e.course_id) AS course_count
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 3;






