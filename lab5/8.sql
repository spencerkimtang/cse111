SELECT COUNT(DISTINCT s_name)
FROM part, partsupp, supplier 
WHERE p_type LIKE '%POLISHED%' 
      AND s_suppkey = ps_suppkey
      AND ps_partkey = p_partkey
      AND p_size IN (3,23,36,49);
      /*
      OR p_size = 3
      OR p_size = 23
      OR p_size = 36
      OR p_size = 49;
      */