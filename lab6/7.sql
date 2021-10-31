SELECT COUNT(s_suppkey)
FROM (SELECT s_suppkey, COUNT(DISTINCT o_orderkey) AS count
        FROM orders, lineitem, nation, customer, supplier
        WHERE s_suppkey = l_suppkey
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey
            AND c_nationkey = n_nationkey
            AND (n_name = 'GERMANY'
            OR n_name = 'FRANCE')
        GROUP BY s_suppkey)
WHERE count < 50;
