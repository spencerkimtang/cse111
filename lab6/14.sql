SELECT supplier, (sold - buy)
FROM (SELECT n_name AS supplier, COUNT(l_quantity) AS sold
      FROM customer, orders, lineitem, supplier, nation
      WHERE c_custkey = o_custkey
            AND l_orderkey = o_orderkey
            AND l_suppkey = s_suppkey
            AND s_nationkey = n_nationkey
            AND c_nationkey != n_nationkey
            AND l_shipdate LIKE '1994%'
      GROUP BY n_name), 
      (SELECT n_name AS customer, COUNT(l_quantity) AS buy
       FROM customer, orders, lineitem, supplier, nation
       WHERE c_custkey = o_custkey
             AND l_orderkey = o_orderkey
             AND l_suppkey = s_suppkey
             AND c_nationkey = n_nationkey
             AND s_nationkey != n_nationkey
             AND l_shipdate LIKE '1994%'
             GROUP BY n_name)
WHERE supplier = customer;