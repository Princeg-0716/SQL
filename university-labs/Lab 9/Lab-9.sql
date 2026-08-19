--From the tables EMPLOYE perform the following queries 
--Part – A: 
	
--1. Display cities where total salary of employees greater than 20000. 
	SELECT CITY,SUM(SALARY)
	FROM EMPLOYEE
	GROUP BY CITY
	HAVING SUM(SALARY) > 20000

--2. Display departments having average salary greater than 12000.
	SELECT DEPARTMENT,AVG(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING AVG(SALARY) > 12000

--3. Display departments having total salary greater than 20000. 
	SELECT DEPARTMENT,SUM(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING SUM(SALARY) > 20000

--4. Display departments having number of employees greater than 2. 
	SELECT DEPARTMENT,COUNT(EID)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING COUNT(EID) > 2

--5. Display cities where minimum salary less than 7000. 
	SELECT CITY,MIN(SALARY)
	FROM EMPLOYEE
	GROUP BY CITY
	HAVING MIN(SALARY) < 7000

--6. Display cities where average salary less than 12000.
	SELECT CITY,AVG(SALARY)
	FROM EMPLOYEE
	GROUP BY CITY
	HAVING AVG(SALARY) < 12000

--7. Display departments where maximum salary greater than 14000. 
	SELECT DEPARTMENT,MAX(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING MAX(SALARY) > 14000

--8. Display cities where total salary greater than equal to 30000.
	SELECT CITY,SUM(SALARY)
	FROM EMPLOYEE
	GROUP BY CITY
	HAVING SUM(SALARY) >= 30000

--9. Display departments having number of employees equal to 2.
	SELECT DEPARTMENT,COUNT(EID)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING COUNT(EID) = 2

--10. Display cities having number of female employees greater than equal to 1. 
	SELECT CITY,COUNT(EID)
	FROM EMPLOYEE
	WHERE GENDER = 'FEMALE'
	GROUP BY CITY
	HAVING COUNT(EID) >= 1

--11. Display departments where minimum salary of male employees greater than 7000.
	SELECT DEPARTMENT,MIN(SALARY)
	FROM EMPLOYEE
	WHERE GENDER = 'MALE'
	GROUP BY DEPARTMENT
	HAVING MIN(SALARY) > 7000

--12. Display cities where maximum salary of female employees less than 13000.
	SELECT CITY,MAX(SALARY)
	FROM EMPLOYEE
	WHERE GENDER = 'FEMALE'
	GROUP BY CITY
	HAVING MAX(SALARY) < 13000

--13. Display departments where average salary greater than 10000 and less than 14000.
	SELECT DEPARTMENT,AVG(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	--HAVING AVG(SALARY) BETWEEN 10000 AND 14000
	HAVING AVG(SALARY) >10000 AND AVG(SALARY) <14000

--14. Display cities where number of employees joined before 2023 greater than 1.
	SELECT CITY,COUNT(EID)
	FROM EMPLOYEE
	WHERE JOININGYEAR < 2023
	GROUP BY CITY
	HAVING COUNT(EID) > 1

--15. Display cities where total salary of male employees greater than 15000, ordered by total salary. 
	SELECT CITY,SUM(SALARY)
	FROM EMPLOYEE
	GROUP BY CITY
	HAVING SUM(SALARY) > 15000
	ORDER BY SUM(SALARY) 

--16. Display departments where maximum salary greater than 13000, ordered by max salary.
	SELECT DEPARTMENT,MAX(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING MAX(SALARY) > 13000
	ORDER BY MAX(SALARY) 

--17. Display cities where total salary of male employees greater than 15000.
	SELECT CITY,SUM(SALARY)
	FROM EMPLOYEE
	WHERE GENDER = 'MALE'
	GROUP BY CITY
	HAVING SUM(SALARY) > 15000

--18. Display departments where employees joined after 2022 and count greater than 1. 
	SELECT DEPARTMENT,COUNT(EID)
	FROM EMPLOYEE
	WHERE JOININGYEAR > 2022
	GROUP BY DEPARTMENT
	HAVING COUNT(EID) > 1

--19. Display departments where average salary of female employees greater than 8000.
	SELECT DEPARTMENT,AVG(SALARY)
	FROM EMPLOYEE
	WHERE GENDER = 'FEMALE'
	GROUP BY DEPARTMENT
	HAVING AVG(SALARY) > 8000

--20. Display departments having total salary greater than 20000 and less than 40000. 
	SELECT DEPARTMENT,SUM(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING SUM(SALARY) > 20000 AND SUM(SALARY) < 40000

--Part – B: 
--21. Display departments having total salary of employees joined after 2021 greater than 20000.
	SELECT DEPARTMENT,SUM(SALARY)
	FROM EMPLOYEE
	WHERE JOININGYEAR > 2021
	GROUP BY DEPARTMENT
	HAVING SUM(SALARY) > 20000

--22. Display cities where average salary of employees joined after 2022 greater than 10000. 
	SELECT CITY,AVG(SALARY)
	FROM EMPLOYEE
	WHERE JOININGYEAR > 2022
	GROUP BY CITY
	HAVING AVG(SALARY) > 10000

--23. Display cities having number of distinct departments greater than 1. 
	SELECT  CITY,COUNT(DISTINCT DEPARTMENT)
	FROM EMPLOYEE
	GROUP BY CITY
	HAVING COUNT(DEPARTMENT) > 1

--24. Display cities where maximum salary of employees joined before 2022 greater than 12000.
	SELECT  CITY,MAX(SALARY)
	FROM EMPLOYEE
	WHERE JOININGYEAR < 2022
	GROUP BY CITY
	HAVING MAX(SALARY) > 12000

--25. Display departments where total salary of female employees less than 15000.
	SELECT DEPARTMENT,SUM(SALARY)
	FROM EMPLOYEE
	WHERE GENDER = 'FEMALE'
	GROUP BY DEPARTMENT
	HAVING SUM(SALARY) < 15000

--Part – C: 
--26. Display cities where number of male employees greater than female employees.
	SELECT CITY, COUNT(EID) FROM EMPLOYEE
	GROUP BY CITY
	HAVING COUNT(
				CASE 
					WHEN GENDER='MALE'
					THEN EID ELSE NULL END)
					> 
			COUNT(CASE 
					WHEN GENDER='FEMALE'
						THEN EID ELSE NULL END)

--27. Display departments having number of cities greater than 1.
	SELECT DEPARTMENT,COUNT(CITY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING COUNT(CITY) > 1

--28. Display cities where total salary excluding IT department greater than 15000.
	SELECT CITY,SUM(SALARY)
	FROM EMPLOYEE
	WHERE DEPARTMENT <> 'IT'
	GROUP BY CITY
	HAVING SUM(SALARY) > 15000

--29. Display departments where average salary excluding HR employees greater than 11000.
	SELECT DEPARTMENT,AVG(SALARY)
	FROM EMPLOYEE
	WHERE DEPARTMENT <> 'HR'
	GROUP BY DEPARTMENT
	HAVING AVG(SALARY) > 11000

--30. Display departments where total salary of male employees greater than female employees. 
	SELECT DEPARTMENT,SUM(SALARY)
	FROM EMPLOYEE
	GROUP BY DEPARTMENT
	HAVING SUM(
				CASE 
					WHEN GENDER='MALE'
					THEN SALARY ELSE 0 END)
				>
			SUM(
				CASE
					WHEN GENDER='FEMALE'
					THEN SALARY ELSE 0 END)


	
