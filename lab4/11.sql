SELECT DISTINCT r_name, s_name, MAX(s_acctbal)
FROM region, supplier, nation
WHERE s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY r_name;

