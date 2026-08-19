--Implement Intermediate Common Table Expressions (CTE) for Query Simplification 

-- From the table STUDENT perform the following queries:  

--Part – A: 

--1. Display all students whose SPI is greater than 8.
	WITH SPI_8 AS(  SELECT * FROM STUDENT
					WHERE SPI > 8 )

	SELECT * FROM SPI_8;

--2. Display average SPI of all students.
	WITH SPI_AVG AS( SELECT AVG(SPI) AS AVGSPI FROM STUDENT )

	SELECT * FROM SPI_AVG;

--3. Display total number of students in each branch.
	WITH STUDENT_COUNT AS ( SELECT BRANCH,COUNT(STDID) AS COUNT FROM STUDENT
							GROUP BY BRANCH )
	
	SELECT * FROM STUDENT_COUNT;

--4. Display students who belong to RAJKOT city.
	WITH STUDENT_RAJKOT AS ( SELECT * FROM STUDENT
							 WHERE CITY = 'RAJKOT' )

	SELECT * FROM STUDENT_RAJKOT;

--5. Find branch names that appear more than once.
	WITH STUDENT_COUNT AS ( SELECT BRANCH,COUNT(STDID) AS COUNT FROM STUDENT
							GROUP BY BRANCH
							HAVING COUNT(STDID) > 1 )

	SELECT * FROM STUDENT_COUNT;

--6. Display row number for each student.
	WITH STUDENT_ROW AS (	SELECT *,
							ROW_NUMBER() OVER(ORDER BY STDID) AS ROW_NUMBER
							FROM STUDENT
							)

	SELECT * FROM STUDENT_ROW;

--7. Display top 3 students based on SPI.
	WITH TOP3_STUDENT AS (	SELECT *,
							DENSE_RANK() OVER(ORDER BY SPI DESC) AS D_R
							FROM STUDENT
							)

	SELECT * FROM TOP3_STUDENT
	WHERE D_R <= 3;

--8. Display students having maximum SPI.
	WITH TOP1_STUDENT AS (	SELECT * FROM STUDENT
							WHERE SPI = ( SELECT MAX(SPI) FROM STUDENT )
							)

	SELECT * FROM TOP1_STUDENT;

--9. Display students having minimum SPI.
	WITH LAST1_STUDENT AS (	SELECT * FROM STUDENT
							WHERE SPI = ( SELECT MIN(SPI) FROM STUDENT )
							)

	SELECT * FROM LAST1_STUDENT;

--10. Display branch -wise rank of students.
	WITH RANK_BRANCH AS(
						SELECT STDID,SNAME , CITY ,BRANCH ,SPI,
						DENSE_RANK() OVER (
											PARTITION BY BRANCH
											ORDER BY SPI  ) AS D_R 
						FROM STUDENT  )

	SELECT * FROM RANK_BRANCH;

--Part – B: 

--11. Display students SPI average belonging to Computer branch.
	WITH COM_SPI AS( SELECT * FROM STUDENT
					 WHERE SPI < ( 
									SELECT AVG(SPI) AS AVG FROM STUDENT
									WHERE BRANCH = 'COMPUTER' ) )

	SELECT * FROM COM_SPI;

--12. Display students whose SPI is greater than average SPI of his/her branch.
	WITH BRANCH_AVG AS (
						SELECT BRANCH, AVG(SPI) AS AVG_SPI
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT S.*
	FROM STUDENT S
	JOIN BRANCH_AVG B
	ON S.BRANCH = B.BRANCH
	WHERE S.SPI > B.AVG_SPI;

--13. Display branch having more than 2 students.
	WITH STUDENT_COUNT AS ( SELECT BRANCH,COUNT(STDID) AS COUNT FROM STUDENT
							GROUP BY BRANCH
							HAVING COUNT(STDID) > 2)

	SELECT * FROM STUDENT_COUNT;

--14. Display branches having average SPI between 7 and 9 
	WITH AVG_SPI AS( SELECT BRANCH,AVG(SPI) AS AVG FROM STUDENT
					 GROUP BY BRANCH
					 HAVING AVG(SPI) BETWEEN 7 AND 9 )
									
	SELECT * FROM AVG_SPI;

--15. Display students whose SPI is lower than overall average SPI.
	WITH LOW_SPI AS( SELECT * FROM STUDENT
					 WHERE SPI < ( SELECT AVG(SPI) AS AVG FROM STUDENT ) )

	SELECT * FROM LOW_SPI;

--Part – C: 

--16. Display branches having exactly one student.
	WITH STUDENT_COUNT AS ( SELECT BRANCH,COUNT(STDID) AS COUNT FROM STUDENT
							GROUP BY BRANCH
							HAVING COUNT(STDID) = 1 )

	SELECT * FROM STUDENT_COUNT;

--17. Display branch having highest average SPI.
	WITH RANK_BRANCH AS (
						SELECT BRANCH,AVG(SPI) AS AVG_SPI,
						RANK() OVER (ORDER BY AVG(SPI) DESC) AS RN
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT * FROM RANK_BRANCH
	WHERE RN = 1;

--18. Display branch having lowest average SPI.
	WITH RANK_BRANCH AS (
						SELECT BRANCH,AVG(SPI) AS AVG_SPI,
						RANK() OVER (ORDER BY AVG(SPI) ) AS RN
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT * FROM RANK_BRANCH
	WHERE RN = 1;

--19. Display students whose SPI is lower than branch average SPI.
	WITH BRANCH_AVG AS (
						SELECT BRANCH, AVG(SPI) AS AVG_SPI
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT S.*
	FROM STUDENT S
	JOIN BRANCH_AVG B
	ON S.BRANCH = B.BRANCH
	WHERE S.SPI < B.AVG_SPI;

--20. Display branches having maximum number of students. 
	WITH RANK_BRANCH AS (
						SELECT BRANCH,COUNT(STDID) AS COUNT,
						RANK() OVER (ORDER BY COUNT(STDID) DESC) AS RN
						FROM STUDENT
						GROUP BY BRANCH )

	SELECT * FROM RANK_BRANCH
	WHERE RN = 1;