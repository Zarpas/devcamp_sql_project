USE devcamp_university_schema_test;


-- The average grade that is given by each professor
SELECT 
	AVG(grades.grades_grade), 
    courses.courses_professors_id, 
    p.professors_name
FROM grades
JOIN courses
ON grades.grades_courses_id = courses.courses_id
JOIN professors AS p
ON courses.courses_professors_id = p.professors_id
GROUP BY courses.courses_professors_id
ORDER BY courses.courses_professors_id;


-- the top grades for each student
SELECT 
	MAX(g.grades_grade) AS `best grade`, 
    g.grades_students_id,
    s.students_id,
    s.students_name, 
    s.students_email 
FROM grades AS g 
JOIN students AS s 
ON g.grades_students_id = s.students_id 
GROUP BY g.grades_students_id
ORDER BY `best grade` DESC;


-- group students by the courses taht they are enrolled in
SELECT 
	COUNT(*) AS student_number, 
	grades_courses_id, 
	courses.courses_subject 
FROM grades 
JOIN courses
ON grades.grades_courses_id = courses.courses_id
GROUP BY grades_courses_id;


-- Create a summary report of courses and their average grades, sorted by the most challenging 
-- course (course with the lowest average grade) to the easiest course
SELECT 
	AVG(g.grades_grade) AS average_grade, 
    g.grades_courses_id,
    c.courses_subject
FROM grades AS g 
JOIN courses AS c 
ON g.grades_courses_id = c.courses_id 
GROUP BY g.grades_courses_id 
ORDER BY average_grade ASC;


-- Finding which student and professor have the most courses in common
SELECT 
	g.grades_students_id,
    s.students_name,
	COUNT(g.grades_courses_id) AS courses_count, 
    c.courses_professors_id,
    p.professors_name
FROM grades AS g
JOIN courses AS c
ON g.grades_courses_id = c.courses_id
JOIN students AS s
ON g.grades_students_id = s.students_id
JOIN professors AS p
ON c.courses_professors_id = p.professors_id
GROUP BY g.grades_students_id, c.courses_professors_id
ORDER BY courses_count DESC;