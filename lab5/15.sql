SELECT (SELECT SUM(l_extendedprice*(1-l_discount)) 
       FROM lineitem, orders, customer, nation custN, region custR, supplier, nation suppN 
       WHERE l_orderkey = o_orderkey 
            AND o_custkey = c_custkey 
            AND c_nationkey = custN.n_nationkey 
            AND custN.n_regionkey = custR.r_regionkey 
            AND custR.r_name = 'ASIA' 
            AND l_suppkey = s_suppkey 
            AND s_nationkey = suppN.n_nationkey 
            AND suppN.n_name = 'UNITED STATES' 
            AND l_shipdate LIKE '1997%')/(SELECT SUM(l_extendedprice*(1-l_discount)) 
                                            FROM lineitem, orders, customer, nation custN, region custR 
                                            WHERE l_orderkey = o_orderkey 
                                                AND o_custkey = c_custkey 
                                                AND c_nationkey = custN.n_nationkey 
                                                AND custN.n_regionkey = custR.r_regionkey 
                                                AND custR.r_name = 'ASIA' 
                                                AND l_shipdate LIKE '1997%');

