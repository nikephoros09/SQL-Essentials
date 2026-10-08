--ex08
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE(fib_sequence INTEGER)
AS $$
    WITH RECURSIVE fib(a, b) AS (
        SELECT 0, 1
        UNION ALL
        SELECT b, a + b
        FROM fib
        WHERE b < pstop)
    SELECT a AS fib_sequence FROM fib
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();

