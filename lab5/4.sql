SELECT DISTINCT c_nation, numCust, numSupp 
FROM (SELECT COUNT(c_custkey) AS numCust, n_name AS c_nation, r_name, c_custkey
        FROM customer, nation, region 
        WHERE r_regionkey = n_regionkey
            AND r_name = 'AFRICA' 
            AND c_nationkey = n_nationkey 
        GROUP BY n_name), 
        (SELECT COUNT(s_suppkey) AS numSupp, n_name AS s_nation, r_name 
        FROM supplier, nation, region 
        WHERE r_regionkey = n_regionkey 
            AND r_name = 'AFRICA' 
            AND s_nationkey = n_nationkey 
        GROUP BY n_name), nation 
WHERE c_nation = s_nation;

/* same
SELECT c_nation, COUNT(c_custkey), COUNT(s_suppkey)
FROM customer, supplier, nation, region
WHERE r_regionkey = n_regionkey
    AND r_name = 'AFRICA' 
    AND c_nationkey = n_nationkey
    AND s_nationkey = n_nationkey 
GROUP BY c_nation;
*/