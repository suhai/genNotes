puts 'creating database with SQLite3 on the fly'
# To begin, you'd need to set up a database inside a directory like so:
$ sqlite3 test.db # to create or access an existing database on on the fly. 
sqlite> CREATE TABLE students (id integer primary key, name, age);
sqlite> INSERT INTO students (name, age) VALUES ('John Bull', 20), ('Pope Francis', 21), ('Alan Shearer', 18), ('Matt Muller', 25);

sqlite> .tables # to see the list of tables in the database
sqlite> .databases # to see the list of databases in the current directory
sqlite> .schema <name of table># to show the schema for a given table
sqlite> SELECT * FROM students; # to see the students table.don't forget the ';'
sqlite> .help # to see the list of available help
sqlite> DROP TABLE students; # to delete the students table
sqlite> .quit # to quit or exit sqlite3
sqlite> SELECT * FROM sqlite_master WHERE type='table'; # a useful command 
# $ rm -rf <name_of_database> from within the terminal/directory to delete a db



puts 'writing code/file to create database with SQLite' # see sqlite3_example.rb
$db = SQLite3::Database.new('dbfile') # if creating a file to hold code.
# Creates a table in the database
# Primary Key automatically generates values that start at 1 and increase by 1
# name is a text field that will hold employee names

CREATE TABLE employees (id integer primary key, name text); 
# Insert some employees
INSERT INTO employees (id, name) VALUES(1, 'Max Eisenhardt');
INSERT INTO employees (name) VALUES('Pietro Maximoff');
INSERT INTO employees (name) VALUES('Wanda Maximoff');
INSERT INTO employees (name) VALUES('Mortimer Toynbee');
INSERT INTO employees (name) VALUES('Jason Wyngarde');
# In column mode, each record is shown on a separate line with the data aligned in columns
# headers on shows the column names, if off they wouldn't show
.mode column
.headers on
select * from employees; # Show all employees
# Changes the width of the columns
.width 15 20
.exit # Closes the database
sqlite3 test.db # Reopen database
.tables # Displays the tables
# Displays every value on its own line
.mode line
select * from employees;
# Shows the statements used to create the database. You could also provide a table name to see how that single table was made
.schema OR .schema employees
# You can get a more detailed database view
.mode column
.headers on
select type, name, tbl_name, sql from sqlite_master order by type;
# Used to show the current settings
.show
# Set NULL to 'NULL'
.nullvalue 'NULL'
.show
# Change the prompt for SQLite
.prompt 'sqlite3> '
.show
# Used to export database into SQL format on the screen
.dump
# Used to output to a file
.output ./Documents/sqlite3Files/employees.sql
.dump
.output stdout # Restores output to the screen
# You don't delete a database with any command. You have to delete the file itself
# You can import the table then with
.read ./Documents/sqlite3Files/employees.sql
# .mode is used to change the formatting of the output
# OPTIONS FOR MODE : column, csv
# html: html table
# insert: insert commands used 
# list: List without commas
# tabs: Tab separated list
# How to output a CSV list to a file
.mode csv # You could define the output should be csv
.separator ,  # OR define the separator for the columns
.output ./Documents/sqlite3Files/employees.csv
.separator ,
select * from employees;
.output stdout
# Output html table
.mode html 
select * from employees;
.output stdout
# line outputs column name and value
.mode line
select * from employees;
.output stdout
# Items with double quotes
.mode tcl
select * from employees;
.output stdout