--1,5,7--
SELECT * FROM BOOKS;
SELECT name, contact as "Contact Person", phone From PUBLISHER;
SELECT distinct(Customer#) from ORDERS;

/*Ch2 Advanced Challenge*/
--1--
SELECT Lastname || ',' || Firstname as Name, City ||',' || State as Location FROM CUSTOMERS;
--2--
SELECT Title, (cost-retail) * -100.00 / cost as "Profit %" FROM BOOKS;

/*Ch8 Hands On*/
--3--
SELECT Title, Category 
FROM BOOKS 
WHERE Category <> 'Fitness';
--4--
SELECT Customer#, LastName, State 
FROM CUSTOMERS
WHERE State='GA' OR State='NJ' 
ORDER BY Lastname ASC;

SELECT Customer#, LastName, State 
FROM CUSTOMERS 
WHERE State IN('GA','NJ')
ORDER BY Lastname ASC;
--7--
SELECT *
FROM CUSTOMERS
WHERE referred is NOT NULL;
--9--
SELECT ISBN, Title
FROM BOOKS
WHERE Title LIKE '_A_N%'
ORDER BY Title DESC;
--10--
SELECT Title, PubDate 
FROM BOOKS 
WHERE (PubDate BETWEEN '05-JAN-01' AND '05-DEC-31') AND (Category='COMPUTER'); --Range

SELECT Title, PubDate 
FROM BOOKS
WHERE PubDate >= '05-JAN-01' AND PubDate <= '05-DEC-31' AND Category='COMPUTER'; --logical operator

SELECT Title, PubDate 
FROM BOOKS 
WHERE (PubDate like '%05') AND (Category='COMPUTER');

/*Ch8 Advanced Challenge*/
--1--
SELECT title, (retail-cost) as "Profit" FROM BOOKS
WHERE (retail-cost) >= 10.00
ORDER BY (retail-cost) DESC;
--2--
SELECT category, pubID, Retail
FROM Books 
WHERE category IN('COMPUTER','FAMILY LIFE')
AND (PubID = 1 OR PubID= 3) 
AND (Retail >= 45);

