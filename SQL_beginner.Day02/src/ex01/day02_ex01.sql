SELECT missing_date::date
FROM generate_series('2022-01-01'::date, '2022-01-10','1 day') AS missing_date
LEFT JOIN 
(SELECT * FROM  person_visits WHERE (person_id='1' OR person_id='2') AND (visit_date BETWEEN
'2022-01-01' AND '2022-10-01'))  AS t2
ON missing_date = t2.visit_date
WHERE visit_date is NULL
ORDER BY missing_date ASC;
