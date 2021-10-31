SELECT n_name, o_orderstatus, COUNT(*)
FROM nation, orders, customer, region
WHERE c_custkey = o_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = 'AMERICA'
GROUP BY n_name, o_orderstatus;