-- STUDENT MANAGEMENT SYSTEM DATABASE

CREATE DATABASE student_management;
USE student_management;

-- 1. Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other')
);

-- 2. Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

-- 3. Enrollments Table (Many-to-Many)
CREATE TABLE enrollments (
    enroll_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 4. Marks Table
CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    enroll_id INT,
    score INT CHECK (score BETWEEN 0 AND 100),
    FOREIGN KEY (enroll_id) REFERENCES enrollments(enroll_id)
);

-- Sample Data
INSERT INTO students(full_name,email,phone,dob,gender) VALUES
('Rohan Sharma','rohan@example.com','9876543210','2002-06-01','Male'),
('Aditi Verma','aditi@example.com','9876500000','2001-09-20','Female');

INSERT INTO courses(course_name,credits) VALUES
('Database Systems',4),
('Operating Systems',3),
('Computer Networks',3);

INSERT INTO enrollments(student_id,course_id) VALUES
(1,1),(1,2),(2,1),(2,3);

INSERT INTO marks(enroll_id,score) VALUES
(1,88),(2,75),(3,92),(4,81);
