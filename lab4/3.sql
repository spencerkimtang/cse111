SELECT n_name, COUNT(o_custkey)
FROM orders, customer, nation, region
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
    AND r_name = "AMERICA"
GROUP BY n_name
ORDER BY n_name;

