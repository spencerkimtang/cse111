SELECT COUNT(count)
FROM (SELECT COUNT(DISTINCT(o_custkey)) AS count
      FROM customer, orders
      WHERE c_custkey = o_custkey
            AND o_orderdate LIKE '1995-11%'
            GROUP BY o_custkey
            HAVING COUNT(o_orderkey) >= 3);


/* 
not sure why isnt working

SELECT COUNT(DISTINCT o_custkey) AS count
FROM customer, orders
WHERE c_custkey = o_custkey
    AND o_orderdate LIKE '1995-11%'
GROUP BY o_custkey
HAVING count >= 3;
*/