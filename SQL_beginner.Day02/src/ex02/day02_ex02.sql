SELECT coalesce(person.name, '-') AS person_name,
coalesce(t1.visit_date, null) AS visit_date,
coalesce(pizzeria.name, '-') AS pizzeria_name
FROM
(SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS t1
FULL JOIN
person ON person.id = t1.person_id 
FULL JOIN 
pizzeria ON pizzeria.id = t1.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name
