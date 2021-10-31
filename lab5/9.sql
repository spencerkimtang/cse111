SELECT p_name
FROM nation, supplier, partsupp, part
WHERE s_nationkey = n_nationkey 
      AND n_name = 'UNITED STATES'
      AND s_suppkey = ps_suppkey
      AND ps_partkey = p_partkey
      AND ps_supplycost * ps_availqty IN (SELECT ps_supplycost * ps_availqty AS total 
                                        FROM partsupp
                                        ORDER BY total DESC
                                        LIMIT (SELECT COUNT(*) * 0.01
                                                    FROM partsupp));

/*
SELECT p_name
FROM supplier, nation, partsupp, (SELECT (ps_supplycost * ps_availqty) as total, p_name
                                        FROM partsupp, part
                                        WHERE ps_partkey = p_partkey
                                        ORDER BY total DESC
                                        LIMIT (SELECT COUNT(*) FROM partsupp) * 0.1)
WHERE n_name = 'UNITED STATES'
    AND s_nationkey = n_nationkey
    AND s_suppkey = ps_suppkey;
*/

