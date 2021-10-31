SELECT ROUND(SUM(ps_supplycost), 2)
FROM part, partsupp
WHERE p_partkey = ps_partkey 
      AND p_retailprice < 1000
      AND p_partkey IN (SELECT l_partkey 
                       FROM lineitem, partsupp 
                       WHERE ps_suppkey = l_suppkey 
                       AND l_shipdate LIKE '1997%') 
                       AND ps_suppkey NOT IN(SELECT DISTINCT ps_suppkey 
                                             FROM partsupp, lineitem, part 
                                             WHERE ps_partkey = p_partkey
                                                   AND p_partkey = l_partkey 
                                                   AND ps_suppkey = l_suppkey 
                                                   AND l_extendedprice < 2000 
                                                   AND l_shipdate LIKE '1996%');



SELECT SUM(ps_supplycost)
FROM partsupp
    INNER JOIN (
    SELECT p_partkey, l_suppkey
    FROM lineitem
    INNER JOIN (
        SELECT p_partkey
        FROM part
        WHERE p_retailprice > 1000
    ) p ON p_partkey = l_partkey
    WHERE strftime('%Y', l_shipdate) = '1997' AND l_suppkey NOT IN (
        SELECT s_suppkey
        FROM supplier
        INNER JOIN (
            SELECT l_suppkey l1_key
            FROM lineitem
            WHERE strftime('%Y', l_shipdate) = '1996' AND l_extendedprice < 2000
        ) l1 ON l1_key = s_suppkey
    ) 
) l ON ps_partkey = p_partkey AND l_suppkey = ps_suppkey



SELECT ROUND(SUM(ps_supplycost), 2)
FROM part, partsupp
WHERE
p_partkey == ps_partkey AND
p_retailprice < 1000 AND
p_partkey IN( SELECT l_partkey FROM lineitem, partsupp WHERE ps_suppkey == l_suppkey AND l_shipdate BETWEEN '1997-00-00' AND '1997-12-50') AND
ps_suppkey NOT IN( SELECT DISTINCT ps_suppkey FROM partsupp, lineitem, part WHERE ps_partkey == p_partkey AND p_partkey == l_partkey AND ps_suppkey = l_suppkey AND l_extendedprice > 2000 AND l_shipdate BETWEEN '1996-00-00' AND '1996-12-50')
