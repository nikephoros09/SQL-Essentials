SELECT pizz_n_visits.name
FROM (SELECT pizzeria.name, person_visits.person_id, person_visits.pizzeria_id, person_visits.visit_date FROM pizzeria JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id) AS 
pizz_n_visits
JOIN person ON person.id = pizz_n_visits.person_id
JOIN menu ON menu.pizzeria_id = pizz_n_visits.pizzeria_id
WHERE person.name = 'Dmitriy' AND pizz_n_visits.visit_date = '2022-01-08' AND menu.price <= '800'; 
