-- DROP INDEX idx_person_name;
-- EXPLAIN ANALYZE
-- SELECT * FROM person WHERE name = 'Elvira'

CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT 
    *
FROM 
    person 
WHERE UPPER(person.name) = 'ELVIRA'

