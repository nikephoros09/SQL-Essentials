CREATE OR REPLACE VIEW currency_last AS
SELECT *
FROM currency c1
WHERE updated = (SELECT  MAX(updated) FROM currency c2 WHERE c1.name = c2.name)


SELECT
    COALESCE("user".name, 'not defined') AS name,
	COALESCE("user".lastname, 'not defined') AS lastname,
	balance.type AS type,
	SUM(balance.money) AS volume,
	COALESCE(currency_last.name, 'not defined') AS currency_name,
	COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
	SUM(money) * COALESCE(rate_to_usd, 1) AS total_volume_in_usd
FROM "user"
FULL JOIN balance On balance.user_id = "user".id
FULL JOIN currency_last On currency_last.id = balance.currency_id
GROUP BY "user".id, balance.type, currency_last.name, currency_last.rate_to_usd
ORDER BY
  COALESCE("user".name, 'not defined') DESC,
  COALESCE("user".lastname, 'not defined') ASC,
  balance.type ASC

