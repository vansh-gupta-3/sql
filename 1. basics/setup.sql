DROP DATABASE IF EXISTS college_db;
CREATE DATABASE college_db;
USE college_db;


-- 2. CREATE TABLES (Data Definition Language - DDL)

-- Parent Table: Clubs
CREATE TABLE clubs (
    club_id INT AUTO_INCREMENT,
    club_name VARCHAR(50) NOT NULL,
    budget DECIMAL(10, 2) DEFAULT 0.00,
    CONSTRAINT pk_clubs PRIMARY KEY (club_id)
);

-- Child Table: Students (Linked to Clubs via Foreign Key)
CREATE TABLE students (
    student_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gpa DECIMAL(3, 2) NOT NULL,
    enrollment_year INT NOT NULL,
    club_id INT,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT fk_students_clubs FOREIGN KEY (club_id) 
        REFERENCES clubs(club_id) 
        ON DELETE SET NULL
);


-- 3. INSERT DATA (Data Manipulation Language - DML)

INSERT INTO clubs (club_name, budget) VALUES 
('Data Science Club', 1500.00),
('Web Dev Crew', 800.00),
('Robotics Corp', 2500.00),
('Cyber Security Clan', 1200.00);

INSERT INTO students (first_name, last_name, gpa, enrollment_year, club_id) VALUES 
('Aarav', 'Sharma', 3.85, 2023, 1),
('Ananya', 'Iyer', 3.92, 2023, 1),
('Vihaan', 'Patel', 2.90, 2024, 2),
('Diya', 'Reddy', 3.40, 2024, 3),
('Kabir', 'Singh', 3.15, 2025, NULL),
('Riya', 'Sen', 3.70, 2023, 2);
