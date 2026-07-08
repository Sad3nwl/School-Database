/*
 : لنفترض أن هناك مدرسة باسم التميز للتعليم الثانوي، ونريد إنشاء قاعدة بيانات مركزية لتضم جميع معلومات المعلمين والطلاب والمواد، مع العلم أنه يجب تخزين المعلومات الآتية لكل طالب (الرقم التسلسلي للطالب، اسم الطالب، تاريخ الميلاد، جنس الطالب، تاريخ الالتحاق، البريد الإلكتروني للطالب، المستوى الدراسي، المسار، المعدل التراكمي للط
 الب) ومعلومات المعلمين كالآتي(الرقم التسلسلي للمعلم، اسم المعلم، تاريخ الميلاد، جنس المعلم، البريد الالكتروني للمعلم، رقم المكتب) ومعلومات المواد كالآتي (الرقم التسلسلي للمادة، اسم المادة).
استخدام التعليقات comments لتوضيح الأوامر.
إنشاء قاعدة البيانات.
إنشاء الجداول.
عرض الجداول المتاحة في قاعدة البيانات.
إدخال معلومات ٣٠ طالب كحد أدنى.
إدخال معلومات ١٠ معلمين كحد أدنى.
إدخال معلومات ٦ مواد كحد أدنى.
عرض محتويات جميع الجداول.
عرض محتويات جدول الطلاب مع ترتيب الصفوف تصاعديًا حسب اسم الطالب.
عرض محتويات جدول الطلاب مع إعطاء اسم مستعار لحقل “اسم الطالب” لاختصار اسم العمود أو جعله ذات معنى.
التعديل على البيانات.
التعديل على بيانات أحد الطلاب وتغيير البريد الالكتروني للطالب.
التعديل على بيانات أحد المعلمين وتغيير رقم المكتب الخاص به.
التعديل على الجداول.
تعديل اسم أحد الجداول.
*/
/*

Let's assume there's a school called Excellence for Secondary Education, and we want to create a central database to contain all information about teachers, students, and subjects. The following information must be stored for each student: (student ID number, student name, date of birth, student gender, enrollment date, student email address, grade level, track, and GPA). Teacher information should be as follows: (teacher ID number, teacher name, date of birth, teacher gender, teacher email address, and office number). Subject information should be as follows: (subject ID number and subject name).

Use comments to clarify commands.

Create the database.

Create tables.

View the available tables in the database.

Enter information for a minimum of 30 students.

Enter information for a minimum of 10 teachers.

Enter information for a minimum of 6 subjects.

View the contents of all tables.

View the contents of the student table with the rows sorted in ascending order by student name.

View the contents of the student table with an alias for the "Student Name" field to shorten the column name or make it more meaningful.

Edit the data. Editing a student's information and changing their email address.

Editing a teacher's information and changing their office number.

Editing schedules.

Changing a schedule name.
--here i dont insert all the students i just inserted some of what they want me too  

*/
-- Create database
create database school;
use school;
 
create table teachers(
teachers_id int primary key,
teachers_name varchar(225),
birth_date date,
gender enum('M','F'),
teachers_email varchar(225),
office_number char
);
alter table students
modify column trake enum('Scientific','literary');
create table courses(
id int primary key,
course_name varchar(50)
);
 
DROP TABLE IF EXISTS Students;
- -- Create Students table
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100) NOT NULL,
    Birth_Date DATE NOT NULL,
    Gender ENUM('M','F') NOT NULL,
    Enrollment_Date DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Academic_Level INT,
    Track VARCHAR(50),
    GPA DECIMAL(3,2)
);
INSERT INTO Students 
(Full_Name, Birth_Date, Gender, Enrollment_Date, Email, Academic_Level, Track, GPA)
VALUES
('Sondos Ali','2000-01-01','F','2015-01-03','sondosali1@gmail.com',2,'Scientific',3.25),
('Roaa Ahmad','2000-01-04','F','2005-01-14','roaaahmad1@gmail.com',3,'Scientific',3.00),
('Ahmad Rami','2001-01-05','M','2016-06-08','ahmadrami2@gmail.com',2,'Scientific',3.36),
('Jomana Yousef','2004-10-11','F','2023-09-16','jomanayousef@gmail.com',4,'Scientific',3.18),
('Sondos Mohammad','2002-11-28','F','2019-11-05','sondosmohammad11@gmail.com',5,'Scientific',3.25),
('Yaser Ahmad','2000-02-25','M','2020-03-19','yaserahmad61@gmail.com',6,'Literary',3.20),
('Omar Saeed','2005-02-08','M','2020-12-22','omarsaeed@gmail.com',4,'Scientific',3.88);
insert into teachers(teachers_id,teachers_name,birth_date,gender,teachers_email,office_number)
values(1,'ahmadalhabashneh','1994-09-03','M','aalhabashneh8@gmail.com','c12'),(2,'alirawashdeh','1990-03-15','M','alir1@gmail.com','A44'),(3,'solafjafal','1988-05-15','F','solafjafal@gmail.com','D11');
DROP TABLE IF EXISTS teachers;
CREATE TABLE Teachers (
/* this point is important beside the primay key */
    Teacher_ID INT PRIMARY KEY AUTO_INCREMENT,
    Full_Name VARCHAR(100),
    Birth_Date DATE,
    Gender ENUM('M','F'),
    Email VARCHAR(100) UNIQUE,
    Office_Number VARCHAR(10)
);
INSERT INTO Teachers
(Full_Name, Birth_Date, Gender, Email, Office_Number)
VALUES
('Ahmad Alhabashneh','1994-09-03','M','aalhabashneh8@gmail.com','201'),
('Ali Rawashdeh','1990-03-15','M','alir1@gmail.com','188'),
('Sola Fjafal','1988-05-15','F','solafjafal@gmail.com','177');
select * from students,teachers,courses;
-- select * from teachers;
insert into courses
values(1,'math'),(2,'english'),(3,'arabic'),(4,'chemistry');
show tables;
select * from teachers where Teacher_ID=2;
select * from students order by Full_Name asc;
select Student_ID,Full_Name as name ,Birth_Date,Gender,Enrollment_Date,Email,Academic_Level,Track,GPA from students;
update Students 
set Track=3 where Student_ID=3;
update Teachers
set Office_Number='D26' where Teacher_ID=2;
select Office_Number from Teachers;
alter table courses
rename to subjects; 
select * from students where Full_name like 'a%'; 
drop table excellent_students;
CREATE TABLE excellent_students AS
SELECT *
FROM students
WHERE gpa > 3.50;
select * from excellent_students;

 

