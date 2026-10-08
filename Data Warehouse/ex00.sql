WITH max_currency AS (
	SELECT
		id,
		name,
		rate_to_usd,
		ROW_NUMBER() OVER (
			PARTITION BY id
			ORDER BY
				updated DESC
		) AS rn
	FROM
		currency
),
latest_currency AS (
	SELECT
		id,
		name,
		rate_to_usd
	FROM
		max_currency
	WHERE
		rn = 1
)
SELECT
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	b.type,
	SUM(b.money) AS volume,
	COALESCE(c.name, 'not defined') AS currency_name,
	COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
	SUM(b.money) * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
FROM
	balance b FULL
	JOIN "user" u ON b.user_id = u.id
	LEFT JOIN latest_currency c ON b.currency_id = c.id
GROUP BY
	COALESCE(u.name, 'not defined'),
	COALESCE(u.lastname, 'not defined'),
	b.type,
	COALESCE(c.name, 'not defined'),
	COALESCE(c.rate_to_usd, 1)
ORDER BY
	name DESC,
	lastname ASC,
	b.type ASC;