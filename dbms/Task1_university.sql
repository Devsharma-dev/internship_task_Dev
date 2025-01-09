-- 1. University Database Schema

-- Scenario

-- This assignment will involve queries related to students, courses, departments, professors, and enrollments.

--  Create DataBase:

	CREATE DATABASE university;

--  Use DataBase:

	USE university;

-- -> Tables:

	-- - Departments Table:

		-- -Create Table:
			CREATE TABLE departments(department_id int AUTO_INCREMENT PRIMARY KEY,department_name varchar(100));

		-- -Insert Records into Table:
			INSERT INTO departments (`department_name`)VALUES ('Information Technology'),('Software Engineering'),('Data Science and Analytics'),('AI and ML'), ('Cyber Security'), ('Cloud Computing'),( 'DBMS'), ('Web Development'),('Mobile Application Development');  
select * from departments;


-- 	- Students Table :

		-- - Create Table:
			CREATE TABLE students (student_id int AUTO_INCREMENT PRIMARY KEY, first_name varchar(100),last_name varchar(100),email varchar(100),phone varchar(20),date_of_birth DATE,enrollment_date DATE,department_id INT,FOREIGN KEY (department_id) REFERENCES departments(department_id));

		-- -Insert Records into Table:
			INSERT INTO students (`first_name`,`last_name`,`email`,`phone`,`date_of_birth`,`enrollment_date`,`department_id`) VALUES ('Sachin','Yadav','yadavsachinhbd1@gmail.com','+918827388030','2002-10-28','2022-07-19',4);
   
            INSERT INTO students (first_name, last_name, email, phone, date_of_birth, enrollment_date, department_id)
            VALUES
    ('Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2000-05-15', '2021-07-10', 1),
    ('Isha', 'Patel', 'isha.patel@example.com', '9876543211', '1999-11-23', '2020-09-12', 2),
    ('Ravi', 'Kumar', 'ravi.kumar@example.com', '9876543212', '2001-02-10', '2021-08-05', 3),
    ('Priya', 'Verma', 'priya.verma@example.com', '9876543213', '1998-07-30', '2019-06-20', 1),
    ('Ananya', 'Reddy', 'ananya.reddy@example.com', '9876543214', '2000-12-22', '2021-07-15', 4),
    ('Arjun', 'Nair', 'arjun.nair@example.com', '9876543215', '2002-03-18', '2022-05-11', 5),
    ('Kavya', 'Gupta', 'kavya.gupta@example.com', '9876543216', '2000-09-05', '2021-09-01', 2),
    ('Mohit', 'Singh', 'mohit.singh@example.com', '9876543217', '1999-01-10', '2020-12-12', 3),
    ('Meera', 'Joshi', 'meera.joshi@example.com', '9876543218', '2001-04-17', '2021-08-25', 4),
    ('Siddharth', 'Desai', 'siddharth.desai@example.com', '9876543219', '2000-10-03', '2021-10-03', 5);

select * from students;

	-- - Professors Table :
 
		-- - Create Table:
			CREATE TABLE professors (professor_id int AUTO_INCREMENT PRIMARY KEY,first_name varchar(100),last_name varchar(100),email varchar(100),phone varchar(20));

		 -- Insert Records into Table:
			INSERT INTO professors (first_name, last_name, email, phone)VALUES('Amit','Sharma','amitsharma@gmail.com', '+919876543210'),
			('Priya', 'Verma', 'priyaverma@gmail.com', '+919823456789');

INSERT INTO professors (first_name, last_name, email, phone)
VALUES
    ('Dr. Arvind', 'Singh', 'arvind.singh@example.com', '9876543210'),
    ('Dr. Ritu', 'Sharma', 'ritu.sharma@example.com', '9876543211'),
    ('Dr. Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9876543212'),
    ('Dr. Priyanka', 'Patel', 'priyanka.patel@example.com', '9876543213'),
    ('Dr. Neha', 'Verma', 'neha.verma@example.com', '9876543214'),
    ('Dr. Anil', 'Reddy', 'anil.reddy@example.com', '9876543215'),
    ('Dr. Manisha', 'Gupta', 'manisha.gupta@example.com', '9876543216'),
    ('Dr. Ajay', 'Desai', 'ajay.desai@example.com', '9876543217'),
    ('Dr. Sneha', 'Joshi', 'sneha.joshi@example.com', '9876543218'),
    ('Dr. Vikram', 'Nair', 'vikram.nair@example.com', '9876543219');


select * from professors;
	-- Courses Table :

		--  Create Table:
			CREATE TABLE Courses(course_id int AUTO_INCREMENT PRIMARY KEY,course_name varchar(100),department_id int,professor_id int,credits int,FOREIGN KEY (department_id)REFERENCES departments(department_id),FOREIGN KEY (professor_id) REFERENCES professors(professor_id));

		--  Insert Records into Table:			
			INSERT INTO courses (course_name, credits, department_id, professor_id) VALUES('Introduction to Programming', 3, 1, 1),('Data Structures and Algorithms', 4, 1, 3),('Database Management Systems', 3, 8, 6);

INSERT INTO Courses (course_name, department_id, professor_id, credits)
VALUES
    ('Introduction to Computer Science', 1, 1, 3),
    ('Data Structures and Algorithms', 1, 2, 4),
    ('Database Management Systems', 1, 3, 3),
    ('Operating Systems', 1, 4, 3),
    ('Discrete Mathematics', 2, 5, 4),
    ('Network Security', 2, 6, 3),
    ('Software Engineering', 3, 7, 4),
    ('Machine Learning', 3, 8, 3),
    ('Linear Algebra', 4, 9, 3),
    ('Artificial Intelligence', 4, 10, 4);

select * from Courses;

		
		
			CREATE TABLE enrollments (enrollment_id int AUTO_INCREMENT PRIMARY KEY,student_id int,course_id int,enrollment_date DATE,grade varchar(5),FOREIGN KEY (student_id) REFERENCES students(student_id),FOREIGN KEY (course_id) REFERENCES courses(course_id));  

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES
    (1, 11, '2023-07-01', 'A'),
    (2, 12, '2023-07-05', 'B+'),
    (3, 13, '2023-08-01', 'A-'),
    (4, 14, '2023-08-10', 'B'),
    (5, 15, '2023-09-15', 'A'),
    (6, 16, '2023-09-20', 'B+'),
    (7, 17, '2023-10-01', 'C'),
    (8, 18, '2023-10-05', 'A-'),
    (9, 19, '2023-11-01', 'B'),
    (10, 20, '2023-11-10', 'A');

select * from enrollments;

-- * SQL Queries for the Case Study:-

-- 1. Find the Total Number of Students in Each Department.
-- 2. List All Courses Taught by a Specific Professor.
-- 3. Find the Average Grade of Students in Each Course.
-- 4. List All Students Who Have Not Enrolled in Any Courses.
-- 5. Find the Number of Courses Offered by Each Department
-- 6. List All Students Who Have Taken a Specific Course (e.g., 'Database Systems')
-- 7. Find the Most Popular Course Based on Enrollment Numbers
-- 8. Find the Average Number of Credits Per Student in a Department
-- 9. List All Professors Who Teach in More Than One Department
-- 10. Get the Highest and Lowest Grade in a Specific Course (e.g., 'Operating Systems')


	1. Find the Total Number of Students in Each Department.

	SELECT COUNT(s.department_id) num_of_students,d.department_name FROM students s INNER JOIN departments d ON s.department_id=d.department_id GROUP BY d.department_id,d.department_name


	2. List All Courses Taught by a Specific Professor

	SELECT c.course_name course, p.first_name taught_by,p.professor_id FROM professors p INNER JOIN courses c ON p.professor_id=c.professor_id

	
	3. Find the Average Grade of Students in Each Course.

	SELECT c.course_id,c.course_name,AVG(e.grade) AVG_grade FROM courses c INNER JOIN enrollments e ON c.course_id=e.course_id GROUP BY e.course_id


	# 4. List All Students Who Have Not Enrolled in Any Courses.

	SELECT s.student_id,s.first_name,s.last_name FROM students s LEFT JOIN  enrollments e ON s.student_id=e.student_id WHERE e.student_id IS null


	# 5. Find the Number of Courses Offered by Each Department.

	SELECT c.department_id,d.department_name,COUNT(c.course_id) num_of_courses FROM courses c INNER JOIN departments d ON c.department_id=d.department_id GROUP BY c.department_id  


	# 6. List All Students Who Have Taken a Specific Course (e.g., 'Database Systems')	

	SELECT s.*,e.course_id,c.course_name FROM students s INNER JOIN enrollments e ON s.student_id=e.student_id INNER JOIN courses c ON c.course_id=e.course_id WHERE c.course_name='Artificial Intelligence';


	# 7. Find the Most Popular Course Based on Enrollment Numbers.

	SELECT c.course_id,c.course_name PopularCourse,COUNT(e.course_id) NumberOfStudentEnrolled FROM enrollments e INNER JOIN courses c ON e.course_id=c.course_id GROUP BY e.course_id ORDER BY COUNT(e.course_id) DESC limit 1


	# 8. Find the Average Number of Credits Per Student in a Department.

	 SELECT s.department_id,AVG(c.credits) as AvgCreaditPerStudent FROM students s INNER JOIN enrollments en ON s.student_id=en.student_id INNER JOIN courses c ON c.course_id=en.course_id GROUP BY   s.department_id;



	# 9. List All Professors Who Teach in More Than One Department.

	 SELECT c.professor_id,p.first_name,p.last_name FROM courses c INNER JOIN professors p ON c.professor_id=p.professor_id GROUP BY p.professor_id HAVING COUNT(DISTINCT(department_id))>1;


	# 10. Get the Highest and Lowest Grade in a Specific Course (e.g., 'Operating Systems')

	 SELECT MAX(e.grade) max_grade,c.course_name,MIN(e.grade) min_grade FROM enrollments e INNER JOIN courses c ON e.course_id=c.course_id GROUP BY e.course_id




	