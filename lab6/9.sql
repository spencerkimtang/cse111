SELECT DISTINCT p_name
FROM orders, customer, nation, region, part, lineitem
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'AMERICA'
    AND p_partkey = l_partkey
    AND l_orderkey = o_orderkey
    AND p_name IN (SELECT DISTINCT p_name
                    FROM supplier, nation, region, part, partsupp, lineitem, orders
                    WHERE s_nationkey = n_nationkey
                        AND n_regionkey = r_regionkey
                        AND r_name = 'ASIA'
                        AND p_partkey = ps_partkey
                        AND ps_suppkey = s_suppkey
                        AND p_partkey = l_partkey
                        AND l_orderkey = o_orderkey 
                        AND l_suppkey = s_suppkey
                    GROUP BY p_name
                    HAVING COUNT(p_partkey) == 3)
ORDER BY p_name;



