SELECT c_name, COUNT(*)
FROM customer, orders, region, nation
WHERE o_custkey = c_custkey
    AND c_nationkey = n_nationkey
    AND n_name = "GERMANY"
    AND o_orderdate >= '1993%'
GROUP BY c_name;
