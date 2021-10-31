SELECT suppReg.r_name, custReg.r_name, SUBSTR(l_shipdate,1,4), SUM(l_extendedprice*(1-l_discount)) 
FROM lineitem, orders, customer, nation custN, region custReg, supplier, nation suppN, region suppReg 
WHERE l_orderkey = o_orderkey 
      AND o_custkey = c_custkey 
      AND c_nationkey = custN.n_nationkey 
      AND custN.n_regionkey = custreg.r_regionkey 
      AND l_suppkey = s_suppkey 
      AND s_nationkey = suppN.n_nationkey 
      AND suppN.n_regionkey = suppReg.r_regionkey 
      AND SUBSTR(l_shipdate,1,4) IN ('1996','1997') 
GROUP BY suppReg.r_name, custReg.r_name, SUBSTR(l_shipdate,1,4) 
ORDER BY suppReg.r_name, custReg.r_name, SUBSTR(l_shipdate,1,4);