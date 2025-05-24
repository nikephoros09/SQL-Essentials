WITH men_visits AS(
    SELECT pizzeria.name 
    FROM person_visits
    JOIN person
    ON person.id = person_visits.person_id
    JOIN pizzeria
    ON pizzeria.id = person_visits.pizzeria_id
    WHERE gender = 'male'
),

    women_visits AS(
    SELECT pizzeria.name 
    FROM person_visits
    JOIN person
    ON person.id = person_visits.person_id
    JOIN pizzeria
    ON pizzeria.id = person_visits.pizzeria_id
    WHERE gender = 'female'
),

    women_only AS(
    SELECT * FROM women_visits
    EXCEPT ALL 
    SELECT * FROM men_visits
),

    men_only AS(
    SELECT * FROM men_visits
    EXCEPT ALL 
    SELECT * FROM women_visits
)

SELECT * FROM men_only 
UNION ALL
SELECT * FROM women_only
ORDER BY 1
