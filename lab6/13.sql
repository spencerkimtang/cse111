SELECT n_name
FROM orders, nation, supplier, lineitem
WHERE l_orderkey = o_orderkey
    AND l_suppkey = s_suppkey 
    AND s_nationkey = n_nationkey 
    AND l_shipdate LIKE '1994%'
GROUP BY n_name
ORDER BY SUM(l_extendedprice) DESC
LIMIT 1;