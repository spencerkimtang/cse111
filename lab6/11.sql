SELECT n_name
FROM customer, nation
WHERE c_nationkey = n_nationkey
GROUP BY n_name 
HAVING COUNT(*) IN (SELECT MIN(small)
                    FROM (SELECT COUNT(c_custkey) AS small
                            FROM customer, nation
                            WHERE c_nationkey = n_nationkey
                            GROUP BY n_name));



