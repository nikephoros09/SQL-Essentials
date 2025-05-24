WITH all_women AS (
SELECT person.name, menu.pizza_name
FROM person 
JOIN person_order 
    ON person.id = person_order.person_id
JOIN menu 
    ON person_order.menu_id = menu.id
WHERE person.gender = 'female'
)

SELECT name
FROM all_women
WHERE pizza_name = 'pepperoni pizza'
INTERSECT
SELECT name
FROM all_women
WHERE pizza_name = 'cheese pizza'
ORDER BY name ASC;

