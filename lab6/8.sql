SELECT COUNT(DISTINCT(c_custkey))
FROM orders, customer
WHERE c_custkey = o_custkey
      AND o_orderkey NOT IN (SELECT DISTINCT(o_orderkey)
                             FROM nation, region, supplier, lineitem, orders
                             WHERE r_regionkey = n_regionkey
                                   AND n_nationkey = s_nationkey
                                   AND s_suppkey = l_suppkey
                                   AND o_orderkey = l_orderkey
                                   AND r_name NOT IN ('AMERICA'));

/*
SELECT COUNT(DISTINCT(c_custkey))
FROM orders, customer
WHERE c_custkey = o_custkey
      AND o_orderkey IN (SELECT DISTINCT(o_orderkey)
                             FROM nation, region, supplier, lineitem, orders
                             WHERE r_regionkey = n_regionkey
                                   AND n_nationkey = s_nationkey
                                   AND s_suppkey = l_suppkey
                                   AND o_orderkey = l_orderkey
                                   AND r_name IN ('AMERICA'));



SELECT COUNT(DISTINCT customer)
FROM (SELECT COUNT(DISTINCT(o_custkey)) AS customer
        FROM orders, lineitem, supplier, nation, region
        WHERE o_orderkey = l_orderkey
            AND l_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND n_regionkey = r_regionkey
            AND r_name = 'AMERICA'
        GROUP BY o_custkey);
*/