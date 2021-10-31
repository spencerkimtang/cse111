SELECT DISTINCT n_name
FROM nation, customer, orders
WHERE n_nationkey = c_nationkey 
    AND c_custkey = o_custkey
    AND o_orderdate >= '1996-09-10' 
    AND o_orderdate <= '1996-09-12'
ORDER BY n_name ASC;

