SELECT o_orderpriority, COUNT(*) 
FROM orders 
WHERE (o_orderdate LIKE '1997-10%' 
       OR o_orderdate LIKE '1997-11%'
       OR o_orderdate LIKE '1997-12%') 
       AND EXISTS (SELECT * 
                   FROM lineitem 
                   WHERE l_orderkey = o_orderkey 
                        AND l_receiptdate < l_commitdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;


/* same
SELECT o_orderpriority, COUNT(*) 
FROM orders, lineitem
WHERE (o_orderdate LIKE '1997-10%' 
    OR o_orderdate LIKE '1997-11%'
    OR o_orderdate LIKE '1997-12%') 
    AND (l_orderkey = o_orderkey 
    AND l_receiptdate < l_commitdate)
GROUP BY o_orderpriority
ORDER BY o_orderpriority;
*/