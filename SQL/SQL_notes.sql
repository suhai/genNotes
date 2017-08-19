/* ==========  SQL NOTES (PostgreSQL) ==========

run ~$ psql to initiate psql. You may get soemthing like:

➜  ~ psql
psql (9.6.2)
Type "help" for help.

suhai=#


DATABASES
1. create a new database with the a command like 'CREATE DATABASE final_test;' on the above line, like :
suhai=# CREATE DATABASE final_test;

2. drop a database with the a command like 'DROP DATABASE some_test;' on the above line, like :
suhai=# DROP DATABASE some_test;

3. Type '\q' to quit or exit psql, like :
suhai=# \q

4. To get inside a database you already created, you can run something like:
➜  ~ psql final_test
psql (9.6.2)
Type "help" for help.

final_test=#

5. Typing '\l' at any time inside the psql prompt would show a list of databases in your psql environment, like:

                                  List of databases
    Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
------------+----------+----------+-------------+-------------+-----------------------
 bank       | suhai    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 final_test | suhai    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres   | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 sqlzoo     | suhai    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 suhai      | suhai    | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
            |          |          |             |             | postgres=CTc/postgres
 template1  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
            |          |          |             |             | postgres=CTc/postgres
(7 rows)


6. To access a particular database, type 'psql <name of database>' like:
➜  ~ psql bank
psql (9.6.2)
Type "help" for help.

bank=#

7. Typing '\d' would show a list of relations(tables) within the 'bank database' like:

bank=# \d
                 List of relations
 Schema |          Name          |   Type   | Owner
--------+------------------------+----------+-------
 public | account                | table    | suhai
 public | account_account_id_seq | sequence | suhai
 public | branch                 | table    | suhai
 public | branch_branch_id_seq   | sequence | suhai
 public | business               | table    | suhai
 public | customer               | table    | suhai
 public | customer_cust_id_seq   | sequence | suhai
 public | department             | table    | suhai
 public | department_dept_id_seq | sequence | suhai
 public | employee               | table    | suhai
 public | employee_emp_id_seq    | sequence | suhai
 public | individual             | table    | suhai
 public | officer                | table    | suhai
 public | officer_officer_id_seq | sequence | suhai
 public | product                | table    | suhai
 public | product_type           | table    | suhai
 public | transaction            | table    | suhai
 public | transaction_txn_id_seq | sequence | suhai
(18 rows)

bank=#


8. Running 'SELECT * FROM <name of relation>; would list the table of <name of relation>, like:
bank=# SELECT * FROM branch;
 branch_id |     name      |       address        |  city   | state |  zip
-----------+---------------+----------------------+---------+-------+-------
         1 | Headquarters  | 3882 Main St.        | Waltham | MA    | 02451
         2 | Woburn Branch | 422 Maple St.        | Woburn  | MA    | 01801
         3 | Quincy Branch | 125 Presidential Way | Quincy  | MA    | 02169
         4 | So. NH Branch | 378 Maynard Ln.      | Salem   | NH    | 03079
(4 rows)

bank=#

///Note that the semi-colons at the end of the querry is very very important to get the result.

9. The quesrry can be modified to suit the user, like:
 cust_id |   fed_id    | cust_type_cd |       address       |   city    | state | postal_code
---------+-------------+--------------+---------------------+-----------+-------+-------------
       1 | 111-11-1111 | I            | 47 Mockingbird Ln   | Lynnfield | MA    | 01940
       2 | 222-22-2222 | I            | 372 Clearwater Blvd | Woburn    | MA    | 01801
(2 rows)
bank=# SELECT * FROM customer LIMIT 2;



TABLES
1. create a new table with the following syntax:
CREATE TABLE table_name
(
  column1 datatype,
  column2 datatype,
  column3 datatype,
  .....
   columnN datatype,
   PRIMARY KEY
  ( one or more columns )
);

Ex1.
CREATE TABLE employees
(
  name TEXT NOT NULL,
  age INT NOT NULL,
  city CHAR(50),
  salary REAL
);

1b. To insert data into the table above:
INSERT INTO employees (name, age, city, salary) VALUES
    ('Oliver Twist', 18, 'San Francisco', 150000),
    ('John Bull', 12, 'Larabanga', 180000),
    ('Sherlock Holmes', 36, 'Accra', 120000),
    ('Simon Peter', 20, 'Portland', 135000);

Ex.2
CREATE TABLE department
(
  dept CHAR(50) NOT NULL,
  emp_id INT NOT NULL
);

testdb-# \d

List of relations
 Schema |    Name    | Type  |  Owner
--------+------------+-------+----------
 public | company    | table | postgres
 public | department | table | postgres
(2 rows)

testdb-# \d company

Table "public.company"
Column   |     Type      | Modifiers
-----------+---------------+-----------
 id        | integer       | not null
 name      | text          | not null
 age       | integer       | not null
 address   | character
(50) |
 salary    | real          |
 join_date | date          |
Indexes:
"company_pkey" PRIMARY KEY, btree (id)

2. To drop a tables:
a. testdb-# DROP TABLE table_name;
b. testdb-# DROP TABLE IF EXISTS table_name;

3. To drop a table, and all the other objects that depend on it, use either of:
a. testdb-# DROP TABLE table_name CASCADE;
b. testdb-# DROP TABLE IF EXISTS table_name CASCADE;
Use CASCADE with great care.





==========  SELF JOINS ==========
A self join is exactly what it sounds like: an instance of a table joining with itself. The way you should visualize a self join for a given table is by imagining a join performed between two identical copies of that table.

Let's take a look at a classic self-join example. This returns each employee's first and last name along with their manager's.
Employee Table

id	f_name	  l_name	    manager_id
1	  Kush	        Patel	        NULL
2	  Jeff	        Fiddler	      1
3	  Quinn	        Leong	        2
4	  Shamayel	    Daoud	        2 
5	  Robert        Koeze	        4
6	  Munyo	        Frey	        3
7	  Kelly	        Chung	        4

SELECT
  team_member.f_name, team_member.l_name,
  manager.f_name, manager.l_name
FROM
  employee AS team_member
JOIN
  employee AS manager ON manager.id = team_member.manager_id

team_member.f_name	team_member.l_name	manager.f_name manager.l_name
Jeff	              Fiddler	            Kush	         Patel
Quinn	              Leong	              Jeff	         Fiddler
Shamayel	          Daoud	              Jeff	         Fiddler
Robert	            Koeze	              Shamayel	     Daoud
Munyo	              Frey	              Quinn	         Leong
Kelly	              Chung	              Shamayel	     Daoud

In all the examples you've covered thus far, JOINs were performed on two different tables (presumably with two different names), which made it easy to reference a specific column in a table. Since we only deal with one table in a self join, we have to use aliases.

An alias is essentially a nickname for a table (or, in some cases, a column). This is necessary because the query processor needs to make a distinction between the duplicates of the same table to JOIN them. Keep in mind, the keyword AS is not necessary to alias tables or columns. The above SQL query could be rewritten:
SELECT
  team_member.first_name, team_member.last_name,
   manager.first_name, manager.last_name
FROM
  employee team_member
JOIN
  employee manager ON manager.id = team_member.manager_id



id name       id  name
-- ----       --  ----
1  Pirate     1   Rutabaga
2  Monkey     2   Pirate
3  Ninja      3   Darth Vader
4  Spaghetti  4   Ninja
Let's join these tables by the name field in a few different ways and see if we can get a conceptual match to those nifty Venn diagrams. 

SELECT * FROM TableA
INNER JOIN TableB
ON TableA.name = TableB.name
id  name       id   name
--  ----       --   ----
1   Pirate     2    Pirate
3   Ninja      4    Ninja
Inner join produces only the set of records that match in both Table A and Table B.


SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name
id    name       id    name
--    ----       --    ----
1     Pirate     2     Pirate
2     Monkey     null  null
3     Ninja      4     Ninja
4     Spaghetti  null  null
null  null       1     Rutabaga
null  null       3     Darth Vader
Full outer join produces the set of all records in Table A and Table B, with matching records from both sides where available. If there is no match, the missing side will contain null.


Venn diagram of SQL cartesian join
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
id  name       id    name
--  ----       --    ----
1   Pirate     2     Pirate
2   Monkey     null  null
3   Ninja      4     Ninja
4   Spaghetti  null  null
Left outer join produces a complete set of records from Table A, with the matching records (where available) in Table B. If there is no match, the right side will contain null.


Venn diagram of SQL left join
SELECT * FROM TableA
LEFT OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableB.id IS null
id  name       id     name
--  ----       --     ----
2   Monkey     null   null
4   Spaghetti  null   null
To produce the set of records only in Table A, but not in Table B, we perform the same left outer join, then exclude the records we don't want from the right side via a where clause. 

join-left-outer.png
SELECT * FROM TableA
FULL OUTER JOIN TableB
ON TableA.name = TableB.name
WHERE TableA.id IS null
OR TableB.id IS null
id    name       id    name
--    ----       --    ----
2     Monkey     null  null
4     Spaghetti  null  null
null  null       1     Rutabaga
null  null       3     Darth Vader
To produce the set of records unique to Table A and Table B, we perform the same full outer join, then exclude the records we don't want from both sides via a where clause. 

join-outer.png
There's also a cartesian product or cross join, which as far as I can tell, can't be expressed as a Venn diagram:
SELECT * FROM TableA
CROSS JOIN TableB

*/