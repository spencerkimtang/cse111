SELECT COUNT(*) 
FROM (SELECT DISTINCT o_orderkey
      FROM customer, orders, lineitem, supplier 
      WHERE o_custkey = c_custkey 
            AND o_orderkey = l_orderkey
            AND l_suppkey = s_suppkey
            AND s_acctbal < 0 
            AND c_acctbal > 0)

/* same
SELECT COUNT(DISTINCT o_orderkey)
FROM customer, orders, lineitem, supplier 
WHERE o_custkey = c_custkey 
      AND o_orderkey = l_orderkey
      AND l_suppkey = s_suppkey
      AND s_acctbal < 0 
      AND c_acctbal > 0;
*/