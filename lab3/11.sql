SELECT COUNT(*)
FROM (SELECT COUNT(c_name)
      FROM lineitem, orders, customer
      WHERE l_discount >= .10
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey
      GROUP BY c_name);

/* all works below
SELECT COUNT(c_name)
      FROM lineitem, orders, customer
      WHERE l_discount >= .10
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey
      GROUP BY c_name;


SELECT COUNT(DISTINCT c_name)
      FROM lineitem, orders, customer
      WHERE l_discount >= .10
            AND l_orderkey = o_orderkey
            AND o_custkey = c_custkey;
*/