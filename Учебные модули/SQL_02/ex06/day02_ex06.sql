SELECT pizz_n_menu.pizza_name, pizz_n_menu.name 
FROM (SELECT pizzeria.name, menu.pizza_name, menu.price, menu.id FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) AS pizz_n_menu
JOIN (SELECT * FROM person_order) AS po ON po.menu_id = pizz_n_menu.id
JOIN person ON person.id = po.person_id
WHERE person.name = 'Anna' OR person.name = 'Denis'
ORDER BY pizz_n_menu.pizza_name, pizz_n_menu.name;
