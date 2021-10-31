SELECT COUNT(supplier)
FROM (SELECT COUNT(DISTINCT(s_suppkey)) AS supplier
        FROM part, partsupp, supplier, nation
        WHERE p_partkey = ps_partkey 
            AND ps_suppkey = s_suppkey
            AND n_nationkey = s_nationkey
            AND n_name = 'UNITED STATES'
        GROUP BY s_suppkey
        HAVING COUNT(p_partkey) >= 40);