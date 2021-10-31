SELECT SUM(o_totalprice)
FROM customer, orders, nation, region
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'AMERICA'
    AND o_orderdate LIKE '1996%';