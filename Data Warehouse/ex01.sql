-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH nearest_rates AS (
    SELECT
        b.user_id,
        b.money,
        b.type,
        b.provider_id,
        b.currency_id,
        b.updated AS bal_updated,
        c.name AS currency_name,
        c.rate_to_usd,
        c.updated AS curr_updated,
        ROW_NUMBER() OVER (
            PARTITION BY b.user_id,
            b.type,
            b.money,
            b.currency_id,
            b.updated
            ORDER BY
                CASE
                    WHEN c.updated <= b.updated THEN 0
                    ELSE 1
                END,
                ABS(
                    EXTRACT(
                        EPOCH
                        FROM
                            (b.updated - c.updated)
                    )
                )
        ) AS rn
    FROM
        balance b
        INNER JOIN currency c ON b.currency_id = c.id
)
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    nr.currency_name,
    (nr.money * nr.rate_to_usd) :: FLOAT AS currency_in_usd
FROM
    nearest_rates nr
    LEFT JOIN "user" u ON nr.user_id = u.id
WHERE
    nr.rn = 1
ORDER BY
    name DESC,
    lastname ASC,
    nr.currency_name ASC;