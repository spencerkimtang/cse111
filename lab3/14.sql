SELECT COUNT(*)
FROM orders, customer, nation
WHERE o_orderpriority = '1-URGENT' 
      AND o_custkey = c_custkey 
      AND c_nationkey = n_nationkey
      AND n_name = 'BRAZIL'
      AND o_orderdate >= '1994-01-01' 
      AND o_orderdate <= '1997-12-31';

/* works too
SELECT COUNT(o_orderpriority)
FROM orders, customer, nation
WHERE o_orderpriority = '1-URGENT' 
      AND o_custkey = c_custkey 
      AND c_nationkey = n_nationkey
      AND n_name = 'BRAZIL'
      AND o_orderdate >= '1994-01-01' 
      AND o_orderdate <= '1997-12-31';
*/