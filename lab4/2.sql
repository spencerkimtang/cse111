SELECT r_name, COUNT(s_nationkey)
FROM region, supplier, nation
WHERE s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY r_name
ORDER BY r_name;

/* same
SELECT r_name, COUNT(s_name)
FROM region, supplier, nation
WHERE s_nationkey = n_nationkey
    AND n_regionkey = r_regionkey
GROUP BY r_name
ORDER BY r_name;
*/