-- Update: Data Science Club will have increased gpa
UPDATE students
SET gpa = LEAST(gpa + 0.05, 4.00)
WHERE club_id = 1;

-- Delete: Remove a club from database
DELETE FROM clubs
WHERE club_name = 'Cyber Security Clan';
