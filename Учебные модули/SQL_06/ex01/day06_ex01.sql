INSERT INTO person_discounts (
    id, 
    person_id, 
    pizzeria_id, 
    discount
)
SELECT
    ROW_NUMBER() OVER() AS id,
    person_id,
    pizzeria_id,
    CASE 
        WHEN order_count = 1 THEN  10.5
        WHEN order_count = 2 THEN  22
        ELSE                       30
    END
    AS discount
FROM (
    SELECT
        po.person_id,
        m.pizzeria_id,
        COUNT(po.person_id) AS order_count
    FROM 
        person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    GROUP BY 
        po.person_id, 
        m.pizzeria_id
) sub;
