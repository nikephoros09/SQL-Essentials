WITH RECURSIVE all_paths AS (
  SELECT point1 AS path, point1, point2, cost
  FROM nodes
  WHERE point1 = 'a'
  UNION
  SELECT all_paths.path || ',' || nodes.point1 AS path,
         nodes.point1, nodes.point2,
         all_paths.cost + nodes.cost
  FROM all_paths JOIN nodes
  ON all_paths.point2 = nodes.point1
  WHERE path NOT LIKE '%' || nodes.point1 || '%'), 

full_routes AS (
  SELECT cost AS total_cost,
    '{' || path || ',' || point2 || '}' AS tour
  FROM all_paths
  WHERE CHAR_LENGTH(path) = 7 AND point2 = 'a')

SELECT *
FROM full_routes
WHERE total_cost = (SELECT MIN(total_cost) FROM full_routes)
UNION
SELECT *
FROM full_routes
WHERE total_cost = (SELECT MAX(total_cost) FROM full_routes)
ORDER BY 1, 2;

