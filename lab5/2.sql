SELECT r_name, COUNT(s_acctbal)
FROM region, nation, supplier,
    (SELECT r_name AS r_supp, AVG(s_acctbal) AS r_bal
    FROM region, nation, supplier
    WHERE s_nationkey = n_nationkey 
        AND r_regionkey = n_regionkey 
    GROUP BY r_name)
WHERE r_name = r_supp
    AND s_acctbal < r_bal
    AND r_regionkey = n_regionkey 
    AND s_nationkey = n_nationkey
GROUP BY r_name;
