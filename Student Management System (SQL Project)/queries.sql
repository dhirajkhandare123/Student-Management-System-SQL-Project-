-- 1. Show all students with enrolled courses
SELECT s.full_name, c.course_name, e.enrollment_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

-- 2. Show average marks of each student
SELECT s.full_name, AVG(m.score) AS average_score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN marks m ON e.enroll_id = m.enroll_id
GROUP BY s.student_id;

-- 3. List top-performing students
SELECT s.full_name, AVG(m.score) AS avg_marks
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN marks m ON e.enroll_id = m.enroll_id
GROUP BY s.student_id
ORDER BY avg_marks DESC
LIMIT 3;

-- 4. View: student marks summary
CREATE VIEW student_summary AS
SELECT s.full_name, c.course_name, m.score
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id
JOIN marks m ON m.enroll_id = e.enroll_id;

-- 5. Stored Procedure: Get student report
DELIMITER $$
CREATE PROCEDURE getStudentReport(IN sid INT)
BEGIN
    SELECT s.full_name, c.course_name, m.score
    FROM students s
    JOIN enrollments e ON s.student_id = e.student_id
    JOIN courses c ON e.course_id = c.course_id
    JOIN marks m ON m.enroll_id = e.enroll_id
    WHERE s.student_id = sid;
END $$
DELIMITER ;
