SELECT r_name
FROM (SELECT r_name, MIN(price)
        FROM (SELECT r_name, SUM (l_extendedprice) AS price
                FROM region, nation, customer, supplier, lineitem
                WHERE r_regionkey = n_regionkey
                    AND n_nationkey = c_nationkey
                    AND s_nationkey = n_nationkey
                    AND l_suppkey = s_suppkey
        GROUP BY r_name));