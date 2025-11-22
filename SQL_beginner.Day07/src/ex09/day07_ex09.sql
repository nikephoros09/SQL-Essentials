--ex09
--Address, strange formula, average, comparison
SELECT
    address,
    ROUND((MAX(age::numeric) - MIN(age::numeric) / MAX(age::numeric)),2) AS formula,
    ROUND(AVG(age),2) AS average,
    CASE
        WHEN ROUND((MAX(age::numeric) - MIN(age::numeric) / MAX(age::numeric)),2) > ROUND(AVG(age),2) 
        THEN 'true' 
        ELSE 'false'
    END comparison
FROM person
GROUP BY address
ORDER BY 1;

