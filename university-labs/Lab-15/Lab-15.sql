--From the table PUBLISHER, AUTHOR and BOOK perform the following queries:  

--Part – A: 

--1. List all books with their authors. 
	SELECT TITLE,AUTHORNAME
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID

--2. List all books with their publishers. 
	SELECT TITLE,PUBLISHERID
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID

--3. List all books with their authors and publishers. 
	SELECT TITLE,AUTHORNAME,PUBLISHERID
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID

--4. List all books published after 2010 with their authors and publisher and price. 
	SELECT TITLE,AUTHORNAME,PUBLISHERID,PRICE
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	WHERE PUBLICATIONYEAR > 2010

--5. List all authors and the number of books they have written.
	SELECT AUTHORNAME,COUNT(BOOKID)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY AUTHORNAME
	
--6. List all publishers and the total price of books they have published. 
	SELECT PUBLISHERID,SUM(PRICE)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY PUBLISHERID

--7. List authors who have not written any books. 
	SELECT AUTHORNAME,COUNT(BOOKID)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY AUTHORNAME
	HAVING COUNT(BOOKID) = 0 

--8. Display the total number of books written by each author along with the average price of their books. 
	SELECT AUTHORNAME,COUNT(BOOKID),AVG(PRICE)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest. 
	SELECT PUBLISHERID,COUNT(BOOKID)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY PUBLISHERID
	ORDER BY COUNT(BOOKID) DESC

--10. Display number of books published each year.
	SELECT PUBLICATIONYEAR,COUNT(BOOKID)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY PUBLICATIONYEAR
	

--Part – B: 
--EMPLOYEE_MASTER 
--EmployeeNo		Name	ManagerNo 
--E01				Tarun	 NULL 
--E02				Rohan	E02
--E03				Priya	E01
--E04				Milan	E03
--E05				Jay		E01
--E06				Anjana	E04

CREATE TABLE EMPLOYEE_MASTER
(
    EMPLOYEENO VARCHAR(5) PRIMARY KEY,
    NAME VARCHAR(30),
    MANAGERNO VARCHAR(5)
);
INSERT INTO EMPLOYEE_MASTER VALUES ('E01','Tarun',NULL),
	('E02','Rohan','E02'),
	('E03','Priya','E01'),
	('E04','Milan','E03'),
	('E05','Jay','E01'),
	('E06','Anjana','E04');
 
--11. List the publishers whose total book prices exceed 500, ordered by the total price. 
	SELECT PUBLISHERID,SUM(PRICE)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY PUBLISHERID
	HAVING  SUM(PRICE) = 500
	ORDER BY  SUM(PRICE)

	

--12. List most expensive book for each author, sort it with the highest price.
	SELECT AUTHORNAME,MAX(PRICE)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY AUTHORNAME
	ORDER BY MAX(PRICE) DESC

--13. Display publisher name and difference between maximum and minimum book price.
	SELECT PUBLISHERID,(MAX(PRICE) - MIN(PRICE))
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY PUBLISHERID

--14. List publisher name and total price of books published each year.
	SELECT PUBLICATIONYEAR,PUBLISHERID,SUM(PRICE)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY PUBLICATIONYEAR , PUBLISHERID

--15. Display author name and total price of books sorted by highest total price. 
	SELECT AUTHORNAME,SUM(PRICE)
	FROM BOOK B
	JOIN AUTHOR A
	ON B.AUTHORID = A.AUTHORID
	GROUP BY AUTHORNAME
	ORDER BY SUM(PRICE) DESC

--From the above table EMPLOYEE_MASTER perform the following queries:  

--Part – C: 

--16. Retrieve the names of employee along with their manager’s name from the Employee table.
	SELECT E1.NAME,E2.NAME
	FROM EMPLOYEE_MASTER E1
	JOIN EMPLOYEE_MASTER E2
	ON E1.MANAGERNO = E2.EMPLOYEENO
	SELECT * FROM EMPLOYEE_MASTER

--17. Display employees who are managers.
	SELECT E2.NAME
	FROM EMPLOYEE_MASTER E1
	JOIN EMPLOYEE_MASTER E2
	ON E1.MANAGERNO = E2.EMPLOYEENO

--18. Display number of employees working under each manager. 
	SELECT E2.EMPLOYEENO,COUNT(E1.EMPLOYEENO)
	FROM EMPLOYEE_MASTER E1
	JOIN EMPLOYEE_MASTER E2
	ON E1.MANAGERNO = E2.EMPLOYEENO
	GROUP BY E2.EMPLOYEENO

--19. Display the employee’s name along with their manager’s name and senior manager name. 
	SELECT E1.NAME AS EMPLOYEE,E2.NAME AS MANAGER,E3.NAME AS SENIOR_MANAGER
	FROM EMPLOYEE_MASTER E1
	LEFT JOIN EMPLOYEE_MASTER E2
	ON E1.MANAGERNO = E2.EMPLOYEENO
	LEFT JOIN EMPLOYEE_MASTER E3
	ON E2.MANAGERNO = E3.EMPLOYEENO

--20. Display managers and count of employees under them in descending order. 
	SELECT E2.NAME,COUNT(E1.EMPLOYEENO)
	FROM EMPLOYEE_MASTER E1
	LEFT JOIN EMPLOYEE_MASTER E2
	ON E1.MANAGERNO = E2.EMPLOYEENO
	GROUP BY E2.NAME
	ORDER BY COUNT(E1.EMPLOYEENO) DESC
	