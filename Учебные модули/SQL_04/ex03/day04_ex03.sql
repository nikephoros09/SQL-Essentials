SELECT 
    d.generated_date AS missing_date
FROM 
    v_generated_dates d
LEFT JOIN person_visits p
    ON d.generated_date = p.visit_date
WHERE 
    p.visit_date IS NULL
ORDER BY 
    missing_date
