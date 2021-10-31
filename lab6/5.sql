SELECT COUNT(DISTINCT(s_suppkey))
FROM partsupp, part, supplier
WHERE p_partkey = ps_partkey
    AND s_suppkey = ps_suppkey
    AND p_retailprice = (SELECT MAX(p_retailprice)
                        FROM part);