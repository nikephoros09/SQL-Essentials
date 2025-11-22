--ex04--
--Name, number of visits if more than 3
SELECT 
    p.name, 
    COUNT(*) AS count_of_visits
FROM 
    person_visits AS pv
JOIN 
    person AS p ON pv.person_id = p.id
GROUP BY p.name
HAVING COUNT(*) > 3

