--ex03--
--Pizzerias and sum of visits and orders
WITH orders AS (
    SELECT
        pz.name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM
        person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
),
visits AS (
    SELECT
        pz.name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM
        person_visits AS pv
    JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
),
statistic AS (
    SELECT
        o.name,
        (o.count + v.count) AS total_count
    FROM
        orders AS o
    JOIN visits AS v ON v.name = o.name
)

SELECT
    pizzeria.name,
    CASE
        WHEN total_count IS NULL THEN 0
        ELSE total_count
    END AS total_count
FROM
    pizzeria
    FULL JOIN statistic ON pizzeria.name = statistic.name
ORDER BY total_count DESC, name ASC;

