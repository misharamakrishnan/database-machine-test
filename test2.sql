 select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |       500 |               1
               2 | keyboard  |            5 |       450 |               3
               3 | modem     |           10 |      1200 |               2
               4 | memory    |          100 |      1500 |               5
               5 | headphone |           50 |       750 |               4
               6 | memory    |            2 |      3500 |               4
(6 rows)

update tbl_stock set int_price=501.5 where pk_int_stock_id=1;
 select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keyboard  |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               4 | memory    |          100 |    1501.5 |               5
               5 | headphone |           50 |     751.5 |               4
               6 | memory    |            2 |    3501.5 |               4
(6 rows)

select * from tbl_stock where int_price >1000;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               3 | modem     |           10 |    1201.5 |               2
               4 | memory    |          100 |    1501.5 |               5
               6 | memory    |            2 |    3501.5 |               4
(3 rows)

 select * from tbl_stock order by vchr_name;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | headphone |           50 |     751.5 |               4
               2 | keyboard  |            5 |     451.5 |               3
               4 | memory    |          100 |    1501.5 |               5
               6 | memory    |            2 |    3501.5 |               4
               3 | modem     |           10 |    1201.5 |               2
               1 | mouse     |           10 |     501.5 |               1
(6 rows)

select * from tbl_stock order by vchr_name limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               5 | headphone |           50 |     751.5 |               4
               2 | keyboard  |            5 |     451.5 |               3
               4 | memory    |          100 |    1501.5 |               5
(3 rows)

select * from tbl_stock order by vchr_name desc limit 3;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               3 | modem     |           10 |    1201.5 |               2
               4 | memory    |          100 |    1501.5 |               5
(3 rows)

SELECT vchr_name,int_price,int_quantity, int_price*int_quantity  AS total
FROM tbl_stock;
 vchr_name | int_price | int_quantity | total
-----------+-----------+--------------+--------
 mouse     |     501.5 |           10 |   5015
 keyboard  |     451.5 |            5 | 2257.5
 modem     |    1201.5 |           10 |  12015
 memory    |    1501.5 |          100 | 150150
 headphone |     751.5 |           50 |  37575
 memory    |    3501.5 |            2 |   7003
(6 rows)

select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keyboard  |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               5 | headphone |           50 |     751.5 |               4
               6 | memory    |            2 |    3501.5 |               4

insert into tbl_dept values(1,'computer science','CS');
select * from tbl_dept;
 pk_int_dept_id |  vchr_dept_name  | vchr_dept_description
----------------+------------------+-----------------------
              1 | computer science | CS
              2 | electronics      | EC
              3 | commerce         | CC
              4 | arts             | AR
(4 rows)

