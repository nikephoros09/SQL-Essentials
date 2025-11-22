--ex05
--Session 1
BEGIN;
--Session 2
BEGIN;
--Session 1
SELECT SUM(rating) FROM pizzeria;
--Session 2
INSERT INTO pizzeria VALUES (10,'Kazan Pizza',5.0);
COMMIT;
--Session 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;
--Session 2
SELECT SUM(rating) FROM pizzeria;
