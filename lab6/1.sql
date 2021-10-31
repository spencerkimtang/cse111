SELECT STRFTIME('%m', l_shipdate), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '%1995%'
-- groups by each distinct month
GROUP BY STRFTIME('%m',l_shipdate);