--ex06
--Pizzeria name, number of orders, average price, max price, min price
SELECT
    pz.name,
    COUNT(*) AS count_of_orders,
    ROUND(AVG(m.price), 2) AS average_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM
    person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
GROUP BY pz.name
ORDER BY pz.name;

