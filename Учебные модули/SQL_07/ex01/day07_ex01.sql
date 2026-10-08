--ex01--
--Names and visits
SELECT
    p.name,
    COUNT(*) AS count_of_visits
FROM
    person_visits AS pv
JOIN
    person AS p
    ON pv.person_id = p.id
GROUP BY
    p.name
ORDER BY count_of_visits DESC, p.name ASC
LIMIT 4;

