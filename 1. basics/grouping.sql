-- Find the average GPA and total students per club, filtering out poor performing groups
SELECT 
    club_id,
    COUNT(student_id) AS total_students,
    ROUND(AVG(gpa), 2) AS average_gpa
FROM 
    students
WHERE 
    club_id IS NOT NULL
GROUP BY 
    club_id
HAVING 
    average_gpa > 3.00;
