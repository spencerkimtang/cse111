SELECT cust, supp, MAX(o_totalprice)
FROM (SELECT MAX(o_totalprice) AS TC, r_name AS cust
		FROM region, nation, customer, orders
		WHERE r_regionkey = n_regionkey 
			AND n_nationkey = c_nationkey 
			AND c_custkey = o_custkey
		GROUP BY cust),
	(SELECT MAX(o_totalprice) AS TS, r_name AS supp
		FROM region, nation, supplier, lineitem, orders
		WHERE r_regionkey = n_regionkey 
			AND n_nationkey = s_nationkey 
			AND s_suppkey = l_suppkey
			AND l_orderkey = o_orderkey
		GROUP BY supp)
WHERE TC >= TS
	OR TS >= TC
GROUP BY cust, supp;




SELECT MAX(o_totalprice) AS TC, r_name AS cust
		FROM region, nation, customer, orders
		WHERE r_regionkey = n_regionkey 
			AND n_nationkey = c_nationkey 
			AND c_custkey = o_custkey
		GROUP BY cust;

SELECT MAX(o_totalprice) AS TS, r_name AS supp
		FROM region, nation, supplier, lineitem, orders
		WHERE r_regionkey = n_regionkey 
			AND n_nationkey = s_nationkey 
			AND s_suppkey = l_suppkey
			AND l_orderkey = o_orderkey
		GROUP BY supp;

SELECT c_name, r_name, MAX(o_totalprice)
FROM customer, nation, region, orders
WHERE c_custkey = o_custkey
	AND c_nationkey = n_nationkey
	AND n_regionkey = r_regionkey
GROUP BY r_name;


SELECT s_name, r_name, MAX(l_extendedprice)
FROM supplier, nation, region, lineitem
WHERE l_suppkey = s_suppkey
	AND s_nationkey = n_nationkey
	AND n_regionkey = r_regionkey
GROUP BY r_name;

SELECT MAX(ps_supplycost)
FROM partsupp



