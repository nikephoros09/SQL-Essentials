SELECT person_order.order_date, CONCAT(person.name, ' (age:', person.age, ')') as person_information
FROM person_order NATURAL JOIN (SELECT person.id AS person_id, person.name, person.age FROM person) person
ORDER BY person_order.order_date, person_information
