SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM 
pizzeria 
JOIN
menu
ON 
menu.pizzeria_id = pizzeria.id 
JOIN 
person_visits
ON
person_visits.pizzeria_id = pizzeria.id
JOIN 
person
ON
person_visits.person_id = person.id
WHERE person.name = 'Kate' AND (menu.price >= '800' AND menu.price <= '1000')
ORDER BY 1,2,3
