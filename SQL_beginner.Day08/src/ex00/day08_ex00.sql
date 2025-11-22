--ex00
--Session 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;
--Session 2
BEGIN;
SELECT * FROM pizzeria;
--Session 1
COMMIT;
--Session 2
COMMIT;
SELECT * FROM pizzeria;
