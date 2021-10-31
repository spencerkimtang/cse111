SELECT s_name, o_orderpriority, COUNT(DISTINCT p_partkey)
FROM supplier, orders, part, lineitem, nation
WHERE s_nationkey = n_nationkey
    AND n_name = 'CANADA'
    AND s_suppkey = l_suppkey
    AND l_partkey = p_partkey
    AND l_orderkey = o_orderkey
GROUP BY s_name, o_orderpriority;



/*
SELECT s_name, o_orderpriority, COUNT(ps_partkey)
FROM supplier, orders, part, lineitem, nation, partsupp
WHERE s_nationkey = n_nationkey
    AND n_name = 'CANADA'
    AND ps_partkey = p_partkey
    AND ps_suppkey = s_suppkey
    AND s_suppkey = l_suppkey
    AND l_partkey = p_partkey
    AND l_orderkey = o_orderkey
GROUP BY s_name, o_orderpriority;
*/