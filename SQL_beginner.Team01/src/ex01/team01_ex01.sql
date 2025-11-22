-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
    COALESCE(usr.name, 'not defined') AS name,
    COALESCE(usr.lastname, 'not defined') AS lastname,
    un_curr.name,
    bal.money * COALESCE(
        (SELECT
            curr.rate_to_usd
        FROM
            currency AS curr
        WHERE
            curr.updated <= bal.updated AND bal.currency_id = curr.id
        ORDER BY curr.updated DESC
        LIMIT 1),

        (SELECT
            curr.rate_to_usd
        FROM
            currency AS curr
        WHERE
            curr.updated >= bal.updated AND bal.currency_id = curr.id
        ORDER BY curr.updated ASC
        LIMIT 1)
    ) AS rate_to_usd
FROM
    balance AS bal
    FULL JOIN "user" AS usr ON bal.user_id = usr.id
    INNER JOIN 
    (SELECT 
        DISTINCT(currency.name),
        currency.id
        FROM
            currency) AS un_curr
        ON un_curr.id = bal.currency_id
ORDER BY
    1 DESC,2,3;

