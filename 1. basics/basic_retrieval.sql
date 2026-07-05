-- Fetch top performing students enrolled in 2023 sorted by highest GPA
SELECT 
    student_id, 
    first_name, 
    last_name, 
    gpa 
FROM 
    students
WHERE 
    enrollment_year = 2023 
    AND gpa >= 3.50
ORDER BY 
    gpa DESC;
