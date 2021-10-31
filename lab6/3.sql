SELECT COUNT(supplier)
FROM (SELECT COUNT(DISTINCT(p_partkey)) AS supplier
      FROM part, partsupp, supplier, nation
      WHERE p_partkey = ps_partkey 
            AND s_suppkey = ps_suppkey 
            AND s_nationkey = n_nationkey
            AND n_name = 'UNITED STATES'
GROUP BY ps_partkey
HAVING COUNT(s_suppkey) = 2);