/**** ฺBORN TO DEV SQL COURSE ****/

/* Lesson 1 */

SELECT * FROM customers; --select all from table name "customer"
/*or you can write as 
SELECT *
FROM customer;
*/
SELECT FirstName FROM customers; --select first name from customer table
SELECT FirstName, LastName FROM customers; --select two column as followed from a table

SELECT FirstName AS Name --select first name but print new name as "name"
, LastName, Company
FROM customers;

SELECT * FROM customers
WHERE Country = "Canada" OR State = "ON" --using WHERE to and condition along with AND/OR;
ORDER BY CustomerId DESC --ASC; --Order the printed value in ascending/decending order by the following column chosen
LIMIT 5; --limitation of printed VALUES

SELECT FirstName, LastName, Address 
FROM customers
WHERE CustomerId >= 11;


/* Lesson 2 */

INSERT into customers --insert into (table name)
VALUES(60, "Supichaya", "Kritpidhayaburana", "JC", "111/4 Bangduen", )
INSERT INTO customers(FirstName, LastName, Email, PostalCode) --insert these three into table customers
VALUES("Supichaya", "Kritpidhayaburana", "mymail@gmail.com",555)

/*UPDATE SET WHERE DELETE*/
UPDATE customers
SET FirstName = "Kalyarak"
, LastName = "Nimsuk"
WHERE CustomerId = 61; --where condition is crucial as update function is sentitive 

DELETE FROM customers
Where CustomerId  > 62 ; --dont forget to state where condition


/* Lesson 3 */

/*Aggregrate Function*/
/*WHERE condition cannot be used*/
SELECT COUNT(FirstName) --print the quantity
FROM customers --Table name
WHERE City = 'Paris';

SELECT AVG(Total) --1
FROM invoices;

SELECT SUM(Total) --2
FROM invoices;

SELECT MIN(Total) --3
FROM invoices;

SELECT MAX(Total) --4
FROM invoices;

SELECT COUNT(CustomerId), City
FROM customers
GROUP BY City; --5

SELECT count(CustomerId) AS NumbersofCustomer, Country
FROM customers
Group By Country
HAVING NumbersofCustomer >= 5 --"WHERE" for aggregate funct and behind GROUP BY
ORDER BY NumbersofCustomer DESC;

SELECT AlbumId, SUM(Milliseconds)/60000 
AS SUMMinutes
FROM tracks
Group by AlbumId
ORDER BY SUMMinutes DESC;


/* Lesson 4*/

/*SQL Operator*/--part of condtions USED inside WHERE

--OR--
SELECT * FROM employees
WHERE Title = "General Manager" 
	OR Title = "Sales Manager"
	OR Title = "Sales Support Agent";
--AND--
SELECT * FROM customers
WHERE Country = "Brazil" AND State = "SP"; 
--NOT--
SELECT * FROM employees
WHERE 
	NOT Title = "IT Staff" ;
--IN--
SELECT * FROM employees
WHERE Title IN ("Sales Support Agent", "Sale Manager", "General Manager");

SELECT * FROM customers
WHERE 
	NOT Country IN ("Brazil", "USA", "Sweden");
--LIKE--
SELECT * FROM customers 
WHERE FirstName LIKE "A%"; --data that starts with 'A' and followed by any which neglect capital letter
--ฺBETWEEN--
SELECT * FROM customers
WHERE CustomerId BETWEEN 1 AND 30 --used instead of >, <
AND Country IN ("Brazil","Czech Republic"); 
-- IS NULL--
SELECT * FROM customers
WHERE /*NOT*/Phone IS NULL; --calling data that is empty

SELECT * FROM customers
WHERE NOT Country IN ("USA","Canada");

/* Lesson 5*/

/* This chapter kinda hard for me, I might need to emphasize a little more */

--INNER JOIN aka JOIN--
/* Intersect set */
SELECT invoices.InvoiceId, customers.FirstName, 
customers.LastName, invoices.total  --select what to be shown
FROM invoices --table1
INNER JOIN customers --table2
ON invoices.CustomerId = customers.CustomerId--select what two data to be joined
ORDER BY InvoiceId ASC;

/*Advanced Case*/
SELECT employees.EmployeeId, employees.FirstName, employees.LastName, employees.Title,
employer.FirstName AS BossInitial, 
employer.LastName AS BOSSLastName
FROM employees
INNER JOIN employees AS employer
ON employees.ReportsTo = employer.EmployeeId; 

-- LEFT JOIN--
SELECT employees.EmployeeId, employees.FirstName, employees.LastName, employees.Title,
employer.FirstName AS BossInitial, 
employer.LastName AS BOSSLastName
FROM employees --table1
LEFT JOIN employees AS employer --table2
ON employees.ReportsTo = employer.EmployeeId; --table1=table2

-- RIGHT JOIN--
-- 
-- SELECT 
-- FROM
-- RIGHT JOIN
-- ON
-- 
-- FULL OUTER JOIN
-- /* Union */
-- /* not really effective in real use case */
-- SELECT 
-- FROM
-- FULL OUTER JOIN
-- ON

/* Lesson 6*/
--CASE--
SELECT InvoiceId, total,
CASE
WHEN total >= 10 THEN "AAA"
WHEN total > 5 AND total < 9.99 THEN "AA"
WHEN total <= 5 THEN "A"
ELSE "NONE"
END AS Results --name of 
/*CASE treated as a field in SELECT section*/
FROM invoices; 

