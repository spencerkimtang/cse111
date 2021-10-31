SELECT n_name, MAX(s_acctbal)
FROM supplier, nation
WHERE s_nationkey = n_nationkey
    AND s_acctbal > 9000
GROUP BY n_name
ORDER BY n_name;

/* same
SELECT n_name, MAX(s_acctbal) AS bal
FROM supplier, nation
WHERE s_nationkey = n_nationkey
GROUP BY n_name
HAVING bal > 9000
ORDER BY n_name;
*/
