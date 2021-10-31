SELECT n_name, COUNT(*), MAX(s_acctbal) 
FROM nation, supplier 
WHERE s_nationkey = n_nationkey
GROUP BY n_name
HAVING COUNT(*) > 5;