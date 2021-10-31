SELECT MIN(l_discount)
FROM orders, lineitem,
    (SELECT AVG(l_discount) AS avg_discount
    FROM lineitem)
WHERE l_orderkey = o_orderkey
      AND o_orderdate LIKE '1996-10%'
      AND avg_discount < l_discount;