
USE devcamp_university_schema_test;

CREATE TABLE students (
  students_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  students_name VARCHAR(45),
  students_email VARCHAR(45),
  PRIMARY KEY (students_id)
);

CREATE TABLE professors (
  professors_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  professors_name VARCHAR(45),
  professors_email VARCHAR(45),
  PRIMARY KEY (professors_id)
);

CREATE TABLE courses (
  courses_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  courses_subject VARCHAR(45),
  courses_professors_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (courses_id),
  KEY courses_professors_id_idx (courses_professors_id),
  FOREIGN KEY (courses_professors_id) REFERENCES professors (professors_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);


CREATE TABLE grades (
  grades_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  grades_grade INT NOT NULL,
  grades_students_id INT UNSIGNED NOT NULL,
  grades_courses_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (grades_id),
  KEY grades_students_id_idx (grades_students_id),
  FOREIGN KEY (grades_students_id) REFERENCES students (students_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  KEY grades_courses_id (grades_courses_id),
  FOREIGN KEY (grades_courses_id) REFERENCES courses (courses_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);
  