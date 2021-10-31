SELECT n_name, COUNT(DISTINCT l_orderkey) as numOrders
FROM nation, lineitem, supplier, orders
WHERE l_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND l_orderkey = o_orderkey
    AND o_orderstatus = 'F'
    AND o_orderdate LIKE '1995%'
    --AND l_quantity > 50
GROUP BY n_name
HAVING numOrders > 50;



/*
SELECT n_name, COUNT(*)
FROM nation, lineitem, supplier, orders
WHERE l_suppkey = s_suppkey
    AND s_nationkey = n_nationkey
    AND l_orderkey = o_orderkey
    AND o_orderstatus = 'F'
    AND o_orderdate LIKE '1995%'
    --AND l_quantity > 50
GROUP BY n_name;
*/
