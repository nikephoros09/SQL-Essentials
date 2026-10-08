WITH RECURSIVE all_paths (path, point1, point2, cost, node_count) AS (
  SELECT
    CAST(point1 AS VARCHAR(255)) AS path,
    point1,
    point2,
    cost,
    1 AS node_count
  FROM
    nodes
  WHERE
    point1 = 'a'
  UNION
  ALL
  SELECT
    CAST(
      all_paths.path || ',' || nodes.point1 AS VARCHAR(255)
    ) AS path,
    nodes.point1,
    nodes.point2,
    all_paths.cost + nodes.cost,
    all_paths.node_count + 1 AS node_count
  FROM
    all_paths
    JOIN nodes ON all_paths.point2 = nodes.point1
  WHERE
    all_paths.path NOT LIKE '%' || nodes.point1 || '%'
),
full_routes AS (
  SELECT
    cost AS total_cost,
    '{' || path || ',' || point2 || '}' AS tour
  FROM
    all_paths
  WHERE
    node_count = 4
    AND point2 = 'a'
)
SELECT
  total_cost,
  tour
FROM
  full_routes
WHERE
  total_cost = (
    SELECT
      MIN(total_cost)
    FROM
      full_routes
  )
UNION
ALL
SELECT
  total_cost,
  tour
FROM
  full_routes
WHERE
  total_cost = (
    SELECT
      MAX(total_cost)
    FROM
      full_routes
  )
ORDER BY
  1,
  2;