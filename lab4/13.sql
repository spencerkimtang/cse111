SELECT COUNT(*)
FROM orders, lineitem,
    (SELECT DISTINCT s_suppkey
     FROM supplier, nation, region, lineitem
     WHERE s_nationkey = n_nationkey
           AND n_regionkey = r_regionkey
           AND r_name = 'AFRICA'
           AND l_suppkey = s_suppkey) supplier,
    (SELECT DISTINCT c_custkey
     FROM customer, nation, region, orders
     WHERE r_regionkey = n_regionkey
           AND n_nationkey = c_nationkey
           AND n_name = 'UNITED STATES'
           AND o_custkey = c_custkey) customer
WHERE o_orderkey = l_orderkey
      AND supplier.s_suppkey = l_suppkey
      AND customer.c_custkey = o_custkey;

/*
SELECT COUNT(DISTINCT o_orderkey)
FROM orders, lineitem, nation, region, customer, supplier
WHERE l_suppkey = s_suppkey
      AND s_nationkey = n_nationkey
      AND n_regionkey = r_regionkey
      AND r_name = 'AFRICA'
      AND o_custkey = c_custkey
      AND c_nationkey = n_nationkey
      AND n_name = 'UNITED STATES'
      AND l_orderkey = o_orderkey;
*/
