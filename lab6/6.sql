SELECT s_name, c_name, MIN(o_totalprice)
FROM supplier, customer, orders, lineitem
WHERE l_suppkey = s_suppkey
      AND o_orderkey = l_orderkey
      AND c_custkey = o_custkey
      AND o_orderstatus = 'F';