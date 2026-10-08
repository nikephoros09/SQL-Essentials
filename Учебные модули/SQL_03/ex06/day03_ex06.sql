WITH t1 AS (SELECT pizzeria.id, menu.pizza_name AS pizza_name, pizzeria.name 
AS pizzeria_name, menu.price 
FROM pizzeria JOIN menu ON menu.pizzeria_id = pizzeria.id)

SELECT t1.pizza_name, t1.pizzeria_name AS pizzeria_name_1, t2.pizzeria_name AS pizzeria_name_2,
t1.price FROM t1 LEFT JOIN t1 AS t2
ON t1.pizza_name = t2.pizza_name AND t1.pizzeria_name != t2.pizzeria_name AND t1.price = t2.price
WHERE t2.pizzeria_name IS NOT NULL AND t1.id > t2.id
ORDER BY 1;
