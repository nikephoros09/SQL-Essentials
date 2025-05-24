WITH 
    men_orders AS(
    SELECT pizzeria.name
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order 
    ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE gender = 'male'

),

    women_orders AS(
    SELECT pizzeria.name
    FROM pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_order 
    ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
    WHERE gender = 'female'
),

    women_only AS(
    SELECT * FROM women_orders
    EXCEPT  
    SELECT * FROM men_orders
),

    men_only AS(
    SELECT * FROM men_orders
    EXCEPT  
    SELECT * FROM women_orders
)

SELECT * FROM men_only 
UNION 
SELECT * FROM women_only
ORDER BY 1;
