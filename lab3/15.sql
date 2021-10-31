SELECT SUBSTR(o_orderdate, 1, 4) AS orderdate, COUNT(o_orderpriority)
FROM orders, nation, supplier, region, lineitem
WHERE s_suppkey = l_suppkey 
      AND l_orderkey = o_orderkey 
      AND s_nationkey = n_nationkey 
      AND r_regionkey = n_regionkey 
      AND o_orderpriority = '3-MEDIUM' 
      AND n_name = 'CANADA'
GROUP BY orderdate;