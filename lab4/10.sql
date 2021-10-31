SELECT p_type, MIN(l_discount), MAX(l_discount) 
FROM lineitem, part 
WHERE l_partkey = p_partkey 
      AND p_type LIKE '%ECONOMY%' 
      AND p_type LIKE '%COPPER%'
GROUP BY p_type 
ORDER BY p_type;