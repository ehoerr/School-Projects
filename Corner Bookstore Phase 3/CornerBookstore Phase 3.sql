
--1--
SELECT Book.BookCode, Title
FROM Book
WHERE Type IN ('FIC', 'MYS', 'ART');

--2--
SELECT Book.Title, Book.BookCode
FROM Book, Publisher
WHERE Book.pubcode = publisher.pubcode
AND publisher.pubname = 'Fawcett Books'
AND Price > 10;

--3--
WITH book1 as (select * FROM Book WHERE price>6),book2 as(SELECT pubcode, COUNT(pubcode) AS count_of_books
FROM Book
GROUP BY pubcode HAVING COUNT(pubcode)>1)
SELECT TO_CHAR(price, '$99.99') "Price", c.pubcode FROM book1 a,book2 c where a.pubcode=c.pubcode;


--4--
SELECT wrote.BookCode, book.Title, author.AuthFName, author.AuthLName, publisher.Pubname, book.PRICE
FROM WROTE, BOOK, Author, Publisher
WHERE wrote.bookcode=book.bookcode
AND WROTE.AUTHORNO= Author.AUTHORNO
AND Publisher.PUBCODE=book.pubcode
AND Price BETWEEN 10 and 20
ORDER BY PubName, price;

--5--
SELECT TO_CHAR(SUM(price*QOH), '$99999.99') "OrderTotal"
FROM Book JOIN Inventory USING(bookcode)
WHERE bookcode = '2281';
--6--
SET SERVEROUTPUT ON
DELETE FROM INVENTORY;

/*

This will insert the values needed to populate the tables on the DB. Please check them over to make sure
they are correct for Blair on monday

-Evan Hoerr 7/13/2018 9:38am 

*/
BEGIN

INSERT INTO Inventory VALUES ('0180', '1', 2);
INSERT INTO Inventory VALUES ('0189', '2', 2);
INSERT INTO Inventory VALUES ('0200', '1', 1);
INSERT INTO Inventory VALUES ('0200', '2', 3);
INSERT INTO Inventory VALUES ('0378', '3', 2);
INSERT INTO Inventory VALUES ('079X', '2', 1);
INSERT INTO Inventory VALUES ('079X', '3', 2);
INSERT INTO Inventory VALUES ('079X', '4', 3);
INSERT INTO Inventory VALUES ('0808', '2', 1);
INSERT INTO Inventory VALUES ('1351', '2', 4);
INSERT INTO Inventory VALUES ('1351', '3', 2);
INSERT INTO Inventory VALUES ('1382', '2', 1);
INSERT INTO Inventory VALUES ('138X', '2', 3);
INSERT INTO Inventory VALUES ('2226', '1', 3);
INSERT INTO Inventory VALUES ('2226', '3', 2);
INSERT INTO Inventory VALUES ('2226', '4', 1);
INSERT INTO Inventory VALUES ('2281', '4', 3);
INSERT INTO Inventory VALUES ('2766', '3', 2);
INSERT INTO Inventory VALUES ('2908', '1', 3);
INSERT INTO Inventory VALUES ('2908', '4', 1);
COMMIT;


DBMS_OUTPUT.PUT_LINE('The transaction was executed and committed.');

--This will roll back the DB if a value is inserted into a table which does not exist >EH--
EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('The transaction was rolled back.'); 
--Feel free to change the message. I couldn't think of anything else lol >EH--
    
END;