--Part – A: 

--1. Combine information from Person and Department table using cross join or Cartesian product. 
	SELECT * 
	FROM PERSON
	CROSS JOIN DEPARTMENT
	
--2. Find all persons with their department name.
	SELECT PERSONNAME,DEPARTMENTNAME
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID

--3. Find all persons with their department name & code. 
	SELECT PERSONNAME,DEPARTMENTNAME,DEPARTMENTCODE
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID

--4. Find all persons with their department code and location.
	SELECT PERSONNAME,DEPARTMENTCODE,LOCATION
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID

--5. Find the detail of the person who belongs to Mechanical department.
	SELECT *
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE DEPARTMENTNAME = 'MECHANICAL'

--6. Final person’s name, department code and salary who lives in Ahmedabad city. 
	SELECT PERSONNAME,DEPARTMENTCODE,SALARY
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE CITY = 'AHMEDABAD'

--7. Find the person's name whose department is in C-Block. 
	SELECT PERSONNAME
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE LOCATION = 'C-BLOCK'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
	SELECT PERSONNAME,SALARY,DEPARTMENTNAME
	FROM PERSON P
	FULL JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE CITY = 'JAMNAGAR'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
	SELECT *
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE DEPARTMENTNAME = 'CIVIL' AND JOININGDATE > '1-Aug-2001'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 25 years. 
	SELECT * 
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE DATEDIFF(YEAR,JOININGDATE,GETDATE()) > 25

--11. Find department wise person counts. 
	SELECT DEPARTMENTNAME,COUNT(PERSONID) AS PERSON
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY DEPARTMENTNAME

--12. Give department wise maximum & minimum salary with department name. 
	SELECT DEPARTMENTNAME,MAX(SALARY) AS MAX,MIN(SALARY) AS MIN
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY DEPARTMENTNAME

--13. Find city wise total, average, maximum and minimum salary.
	SELECT CITY,AVG(SALARY) AS AVG,MAX(SALARY) AS MAX,MIN(SALARY) AS MIN
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY CITY

--14. Find the average salary of a person who belongs to Ahmedabad city. 
	SELECT AVG(SALARY) AS AVG
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE CITY = 'AHMEDABAD'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column) 
	SELECT CONCAT(PERSONNAME,' LIVES IN ',CITY,' AND WORKS IN ',DEPARTMENTNAME,' DEPARTMENT ') 
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID

--Part – B: 

--16. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column) 
	SELECT CONCAT(PERSONNAME,' EARNS ',CITY,' FROM ',DEPARTMENTNAME,' DEPARTMENT MONTHLY ') 
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID

--17. Find city & department wise total, average & maximum salaries. 
	SELECT CITY,DEPARTMENTNAME,SUM(SALARY) AS TOTAL,AVG(SALARY) AS AVG,MAX(SALARY) AS MAX
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY CITY,DEPARTMENTNAME

--18. Find all persons who do not belong to any department. 
	SELECT *
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE DEPARTMENTNAME IS NULL

--19. Find all departments whose total salary is exceeding 100000.
	SELECT DEPARTMENTNAME,SUM(SALARY) AS SUM
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY DEPARTMENTNAME
	HAVING SUM(SALARY) > 100000


 
--Part – C: 


--20. List all departments who have no person. 
	SELECT DEPARTMENTNAME,COUNT(PERSONID)
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY DEPARTMENTNAME
	HAVING COUNT(PERSONID) = 0

--21. List out department names in which more than two persons are working.
	SELECT DEPARTMENTNAME,COUNT(PERSONID)
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	GROUP BY DEPARTMENTNAME
	HAVING COUNT(PERSONID) > 2

--22. Give a 10% increment in the computer department employee’s salary. (Use Update)
	UPDATE P
	SET P.SALARY = P.SALARY * 1.10
	FROM PERSON P
	JOIN DEPARTMENT D
	ON P.DEPARTMENTID = D.DEPARTMENTID
	WHERE D.DEPARTMENTNAME = 'COMPUTER';


	SELECT * FROM DEPARTMENT

	
	SELECT * FROM PERSON