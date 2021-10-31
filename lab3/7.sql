SELECT 
    SUBSTR(l_receiptdate, 1, 7) as yearMonth,
    COUNT(*)
FROM lineitem, customer, orders
WHERE c_name = 'Customer#000000010' 
    AND c_custkey = o_custkey 
    AND o_orderkey = l_orderkey
    AND l_receiptdate LIKE '1993%'
GROUP BY yearMonth;

