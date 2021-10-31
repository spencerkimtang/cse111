SELECT lowest
FROM (SELECT p_name as lowest, MIN(l_extendedprice*(1-l_discount))
      FROM lineitem, part
      WHERE l_shipdate > '1996-10-02' 
            AND l_partkey = p_partkey
      ORDER BY (l_extendedprice*(1-l_discount))); 
