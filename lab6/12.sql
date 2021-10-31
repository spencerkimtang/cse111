SELECT n_name
FROM (SELECT n_name, MIN(small)
      FROM (SELECT n_name, SUM(o_totalprice) AS small
            FROM customer, orders, nation
            WHERE n_nationkey = c_nationkey
                AND o_custkey = c_custkey
            GROUP BY n_name));