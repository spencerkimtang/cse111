SELECT s_name, s_acctbal
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey
        AND n_regionkey = r_regionkey
        AND r_name = 'AMERICA'
        AND s_acctbal > '5000'
ORDER BY s_name;