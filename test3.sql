select sum(int_price) from tbl_stock;
  sum
--------
 6407.5
(1 row)




select sum(int_quantity) from tbl_stock;
sum
-----
  77
(1 row)




select count(*) as items from tbl_stock;
 items
-------
     5
(1 row)




select max(int_price) from tbl_stock;
  max
--------
 3501.5
(1 row)




select sum(int_count)as total_enrollment from tbl_enrollment;
 total_enrollment
------------------
              351
(1 row)



select count(*)as no_of_classes from tbl_enrollment;
 no_of_classes
---------------
             7
(1 row)




select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quantity | int_price | fk_int_supplier
-----------------+-----------+--------------+-----------+-----------------
               1 | mouse     |           10 |     501.5 |               1
               2 | keyboard  |            5 |     451.5 |               3
               3 | modem     |           10 |    1201.5 |               2
               5 | headphone |           50 |     751.5 |               4
               6 | memory    |            2 |    3501.5 |               4






select upper(vchr_name)as products,round(int_price)as roundedprice from tbl_stock;

 products  | roundedprice
-----------+--------------
 MOUSE     |          502
 KEYBOARD  |          452
 MODEM     |         1202
 HEADPHONE |          752
 MEMORY    |         3502
(5 rows)




select concat(vchr_name,int_price)as product_price from tbl_stock;

product_price
----------------
 mouse501.5
 keyboard451.5
 modem1201.5
 headphone751.5
 memory3501.5
(5 rows)






create table tbl_student(enrl_no int,pk_roll_no int primary key,student_name varchar(100),city_name varchar(100),mobile bigint,dob date);

insert into tbl_student(enrl_no,pk_roll_no,student_name,city_name,mobile,dob)values(11,2,'akhil','delhi',98756579,'1986-01-12');
select * from tbl_student;
 enrl_no | pk_roll_no | student_name | city_name |  mobile   |    dob
---------+------------+--------------+-----------+-----------+------------
      11 |          2 | akhil        | delhi     |  98756579 | 1986-01-12
       6 |          4 | maya         | bangalore |  98734534 | 1987-11-12
       1 |          8 | anoop        | bangalore |  93456535 | 1990-12-22
      20 |          1 | paul         | cochin    | 967554555 | 1991-03-13
       3 |          5 | sandeep      | delhi     |  84865644 | 1993-06-14
(5 rows)

create table tbl_grade(fk_roll_no int,course varchar(20),grade varchar(10),foreign key(fk_roll_no)references tbl_student(pk_roll_no)on delete cascade on update cascade);

insert into tbl_grade(fk_roll_no,course,grade)values(2,'c','A'),(2,'JAVA','A'),(1,'C','B'),(1,'JAVA','A'),(4,'PHP','A'),(4,'JAVA',A),(4,'C','B'),(5,'PHP',A),(5,'JAVA','D');
select * from tbl_grade;
 fk_roll_no | course | grade
------------+--------+-------
          2 | c      | A
          2 | JAVA   | A
          1 | C      | B
          1 | JAVA   | A
          4 | PHP    | A
          4 | JAVA   | A
          4 | C      | B
          5 | PHP    | A
          5 | JAVA   | D
(9 rows)




select student_name,course,grade from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where grade='A';
 student_name | course | grade
--------------+--------+-------
 akhil        | JAVA   | A
 akhil        | c      | A
 maya         | JAVA   | A
 maya         | PHP    | A
 paul         | JAVA   | A
 sandeep      | PHP    | A
(6 rows)


select count(distinct student_name)from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where grade='B';
 count
-------
     2
(1 row)


select student_name,pk_roll_no,count(distinct course)as no_of_classes from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no group by pk_roll_no;
student_name | pk_roll_no | no_of_classes
--------------+------------+---------------
 paul         |          1 |             2
 akhil        |          2 |             2
 maya         |          4 |             3
 sandeep      |          5 |             2
(4 rows)





select student_name from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where city_name = 'bangalore' and course = 'java';
student_name
--------------
(0 rows)




select student_name,course from tbl_student inner join tbl_grade on pk_roll_no = fk_roll_no where student_name like 'a%';
student_name | course
--------------+--------
 akhil        | c
 akhil        | JAVA
(2 rows)


select student_name,extract(year from current_date)-extract(year from dob)as agen from tbl_student;
student_name | agen
--------------+------
 akhil        |   37
 maya         |   36
 anoop        |   33
 paul         |   32
 sandeep      |   30
(5 rows)




select student_name,age(current_date,dob)from tbl_student;
student_name |           age
--------------+-------------------------
 akhil        | 37 years 1 mon 7 days
 maya         | 35 years 3 mons 7 days
 anoop        | 32 years 1 mon 28 days
 paul         | 31 years 11 mons 6 days
 sandeep      | 29 years 8 mons 5 days
(5 rows)



select student_name, to_char(dob,'dd-mon-yyyy')as date_of_birth from tbl_student;
student_name | date_of_birth
--------------+---------------
 akhil        | 12-jan-1986
 maya         | 12-nov-1987
 anoop        | 22-dec-1990
 paul         | 13-mar-1991
 sandeep      | 14-jun-1993
(5 rows)