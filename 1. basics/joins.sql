-- Inner Join: Show only students who belong to a valid club
SELECT 
    s.student_id,
    CONCAT(s.first_name, ' ', s.last_name) AS student_name,
    s.gpa,
    c.club_name
FROM 
    students s
INNER JOIN 
    clubs c ON s.club_id = c.club_id;

-- Left Join: Show ALL students, including those without a club
SELECT 
    s.first_name,
    s.last_name,
    COALESCE(c.club_name, 'No Club Assigned') AS club_status
FROM 
    students s
LEFT JOIN 
    clubs c ON s.club_id = c.club_id;
