-- SQLBook: Code
set
    @ @foreign_key_checks = OFF;

CREATE TABLE Campuses (
    campus_name varchar(20) NOT NULL Primary Key,
    city varchar(20) NOT NULL,
    state varchar(20) NOT NULL,
    country varchar(20) NOT NULL
);

CREATE TABLE Users (
    user_id int(10) NOT NULL Primary Key AUTO_INCREMENT,
    user_name varchar(20) NOT NULL,
    user_password varchar (100) NOT NULL,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(200),
    mobile varchar(50),
    role_type varchar(10) NOT NULL,
    department varchar(50),
    Foreign Key (department) References Departments(department_name),
    advisor int(10),
    campus varchar(50),
    Foreign Key (campus) References Campuses(campus_name),
    college varchar(50),
    required_credits int(3),
    accquired_credits int(3),
    time_ticket_from datetime,
    time_ticket_to datetime,
    office_hour varchar(50)
);

CREATE TABLE Colleges (
    college_name varchar(50) NOT NULL Primary Key,
    campus varchar(20) NOT NULL,
    dean int(10),
    Foreign Key (dean) References Users(user_id),
    Foreign Key (campus) References Campuses(campus_name)
);

CREATE TABLE Departments (
    department_name varchar(50) NOT NULL Primary Key,
    department_chair int(10) NOT NULL,
    college varchar(50),
    Foreign Key (department_chair) References Users(user_id),
    Foreign Key (college) References Colleges(college_name)
);

-- CREATE TABLE Advisors (
-- 	user_id int(10) NOT NULL Primary Key,
--     user_name varchar(20) NOT NULL,
--     email varchar(200) NOT NULL,
--     department varchar(50) NOT NULL,
--     office_hour varchar(50) NOT NULL,
-- 	Foreign Key (user_id) References Users(user_id),
--     Foreign Key (department) References Department(department_name)
-- );
-- CREATE TABLE Students (
-- 	user_id int(10) NOT NULL Primary Key,
--     user_name varchar(20) NOT NULL,
--     email varchar(200) NOT NULL,
--     campus varchar(20) NOT NULL,
--     department varchar(50) NOT NULL,
--     advisor int(10),
--     required_credits int(3) NOT NULL,
--     accquired_credits int(3) NOT NULL,
--     time_ticket datetime,
-- 	Foreign Key (user_id) References Users(user_id),
--     Foreign Key (campus) References Campus(campus_name),
--     Foreign Key (department) References Department(department_name),
--     Foreign Key (advisor) References Advisors(user_id)
-- );
-- CREATE TABLE Admins (
-- 	user_id int(10) NOT NULL Primary Key,
--     user_name varchar(20) NOT NULL,
--     email varchar(200) NOT NULL,
--     department varchar(50) NOT NULL,
--     description varchar(200) NOT NULL,
-- 	Foreign Key (user_id) References Users(user_id),
-- 	Foreign Key (department) References Department(department_name)
-- );
CREATE TABLE Courses (
    CRN int(10) NOT NULL Primary Key,
    course_id varchar(10) NOT NULL,
    course_name varchar(50) NOT NULL,
    credits int(1) NOT NULL,
    professor varchar(50),
    course_description varchar(1000),
    prerequisites varchar(100),
    classroom varchar(10),
    building varchar(50),
    campus varchar(50),
    department varchar(50) NOT NULL,
    college varchar(50) NOT NULL,
    term varchar(20) NOT NULL,
    course_capacity int(3) NOT NULL,
    waitlist_capacity int(2) NOT NULL,
    num_students_enrolled int(3) NOT NULL,
    num_students_waitlisted int(2) NOT NULL,
    posted_by varchar(50),
    created_by datetime,
    Foreign Key (college) References Colleges(college_name),
    Foreign Key (department) References Departments(department_name)
);

CREATE TABLE StudentRegisteredCourses (
    student_id int(10) NOT NULL Primary Key,
    CRN int(10) NOT NULL Primary Key
);

CREATE TABLE StudentWaitlistedCourses (
    student_id int(10) NOT NULL Primary Key,
    CRN int(10) NOT NULL Primary Key
);

ALTER TABLE
    Users
ADD
    CONSTRAINT fk_user Foreign Key (department) References Departments(department_name);

set
    @ @foreign_key_checks = ON;