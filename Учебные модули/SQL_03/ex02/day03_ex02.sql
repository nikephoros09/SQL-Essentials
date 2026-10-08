WITH no_orders AS(
SELECT id as menu_id
FROM menu
WHERE NOT EXISTS (SELECT * FROM person_order WHERE person_order.menu_id = menu.id)
ORDER BY menu_id)

SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name
FROM no_orders
JOIN menu
ON  menu.id = no_orders.menu_id
JOIN pizzeria
ON pizzeria.id = menu.pizzeria_id
ORDER BY 1,2;

