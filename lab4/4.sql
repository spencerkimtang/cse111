SELECT s_name, COUNT(p_size)
FROM supplier, part, nation, partsupp
WHERE s_nationkey = n_nationkey
    AND n_name = "CANADA"
    AND p_partkey = ps_partkey
    AND ps_suppkey = s_suppkey
    AND p_size < 20
GROUP BY s_name
ORDER BY s_name;