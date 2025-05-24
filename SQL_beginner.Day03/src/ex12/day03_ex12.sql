INSERT INTO person_order (id, person_id, menu_id, order_date) 
SELECT
generate_series(
(SELECT max(id) from person_order)+1, 
(SELECT max(id) from person) + (SELECT max(id) FROM person_order)
),

generate_series(
(SELECT min(id) from person),
(SELECT max(id) from person)
), 
(SELECT id FROM menu WHERE pizza_name='greek pizza'),
'2022-02-25';
