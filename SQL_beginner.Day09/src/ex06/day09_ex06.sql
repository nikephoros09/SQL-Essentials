--ex06
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date (
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice  NUMERIC DEFAULT 500,
    IN pdate   DATE DEFAULT '2022-01-08')
RETURNS TABLE (
    pizzeria_name VARCHAR)
AS $$
BEGIN
    RETURN QUERY
        SELECT pz.name
        FROM person_visits AS pv
        JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
        JOIN person AS p    ON p.id = pv.person_id
        JOIN menu AS m      ON pz.id = m.pizzeria_id
        WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(
    pperson := 'Anna',
    pprice := 1300,
    pdate := '2022-01-01');

