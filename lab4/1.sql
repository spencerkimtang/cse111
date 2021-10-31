SELECT c_name, SUM(o_totalprice)
FROM (SELECT c_custkey, o_custkey, c_name, n_name, o_totalprice
        FROM customer, orders, nation 
        WHERE n_name = 'FRANCE'
            AND o_orderdate LIKE '1995%'
            AND o_custkey = c_custkey
            AND c_nationkey = n_nationkey)
GROUP BY c_custkey;
    
/* same
SELECT c_name, SUM(o_totalprice)
FROM customer, orders, nation 
WHERE n_name = 'FRANCE'
    AND o_orderdate LIKE '1995%'
    AND o_custkey = c_custkey
    AND c_nationkey = n_nationkey
GROUP BY c_custkey;
*/