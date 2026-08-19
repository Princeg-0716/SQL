--From the table STUDENT perform the following queries:  

--Part – A: 

--1. Display rank of students based on SPI. 
	SELECT *, 
	RANK()
	OVER (ORDER BY SPI DESC) AS RANK
	FROM STUDENT

--2. Display dense rank of students based on SPI.
	SELECT *, 
	DENSE_RANK()
	OVER (ORDER BY SPI DESC) AS DENSE_RANK
	FROM STUDENT

--3. Display sequential number for each student record.
	SELECT *, 
	ROW_NUMBER()
	OVER (ORDER BY SPI DESC) AS ROW_NUMBER
	FROM STUDENT

--4. Display branch-wise rank of students.
	SELECT BRANCH,STDID,SPI,
    RANK() OVER (
				PARTITION BY BRANCH 
				ORDER BY SPI DESC ) AS RANK
	FROM STUDENT;

--5. Display branch-wise dense ranking of students.
	SELECT BRANCH,STDID,SPI,
    DENSE_RANK() OVER (
				PARTITION BY BRANCH 
				ORDER BY SPI DESC ) AS RANK
	FROM STUDENT;

--6. Display branch-wise sequential numbering of students. 
	SELECT BRANCH,STDID,SPI,
    ROW_NUMBER() OVER (
				PARTITION BY BRANCH 
				ORDER BY SPI DESC ) AS RANK
	FROM STUDENT;

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of SPI. 
	SELECT SNAME,SPI,
	LAG(SPI) OVER (ORDER BY SPI),
	SPI-LAG(SPI) OVER (ORDER  BY SPI)
	FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.
	SELECT SNAME,SPI,
	LEAD(SPI) OVER (ORDER BY SPI),
	SPI-LEAD(SPI) OVER (ORDER  BY SPI)
	FROM STUDENT
	ORDER BY SPI DESC

--9. Display top 3 students based on SPI.
	SELECT *
	FROM (
			SELECT *,
			RANK() OVER (ORDER BY SPI DESC) AS R
			FROM STUDENT
		) AS T
	WHERE R <= 3;

--10. Display top 2 students from each branch. 
	SELECT *
	FROM (
			SELECT * , 
			DENSE_RANK()
			OVER (
					PARTITION BY BRANCH
					ORDER BY SPI DESC	) AS DE
					FROM STUDENT
		) AS T
	WHERE DE <= 2;

--Part – B: 

--11. Display 5th highest SPI.
	SELECT *
	FROM (
			SELECT * , 
			DENSE_RANK()
			OVER (ORDER BY SPI DESC) AS DE
			FROM STUDENT
		) AS T
	WHERE DE = 5;
	

--12. Display 6th highest SPI. 
	SELECT *
	FROM (
			SELECT * , 
			DENSE_RANK()
			OVER (ORDER BY SPI DESC) AS DE
			FROM STUDENT
		) AS T
	WHERE DE = 6;

--13. Display students having same ranking.
	SELECT *
	FROM (
			SELECT * , 
			DENSE_RANK()
			OVER (ORDER BY SPI DESC) AS DE
			FROM STUDENT
		) AS T   
	WHERE DE IN (
				SELECT DE
				FROM (
						SELECT DENSE_RANK() OVER (ORDER BY SPI DESC) AS DE
						FROM STUDENT
					) AS R
				GROUP BY DE
				HAVING COUNT(DE) > 1
				);

--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI. 
	SELECT SNAME,
	LAG(SPI) OVER (ORDER BY SPI),
	SPI,
	LEAD(SPI) OVER (ORDER  BY SPI)
	FROM STUDENT
	
--15. Display topper of each branch. 
	SELECT *
	FROM (
			SELECT * , 
			DENSE_RANK()
			OVER (
					PARTITION BY BRANCH 
					ORDER BY SPI DESC) AS DE
			FROM STUDENT
		) AS T
	WHERE DE = 1;

--Part – C: 

--16. Display students whose SPI is greater than the previous student and less than the next student.
	SELECT *
	FROM (
			SELECT *,
			LAG(SPI) OVER (ORDER BY SPI) AS PRE_SPI,
			LEAD(SPI) OVER (ORDER BY SPI) AS NEXT_SPI
			FROM STUDENT
		) AS T
	WHERE SPI > PRE_SPI AND SPI < NEXT_SPI;

--17. Display branch-wise second topper students.
	SELECT *
	FROM (
			SELECT * , 
			DENSE_RANK()
			OVER (
					PARTITION BY BRANCH 
					ORDER BY SPI DESC) AS DE
			FROM STUDENT
		) AS T
	WHERE DE = 2;

--18. Display students whose rank and dense rank are different.
	SELECT *
	FROM (
			SELECT * ,
			RANK() OVER (ORDER BY SPI ) AS R ,
			DENSE_RANK() OVER (ORDER BY SPI) AS D
			FROM STUDENT
		) AS T
	WHERE R <> D

--19. Display consecutive students having same branch ordered by SPI. 
	SELECT *
	FROM (
			SELECT *,
			LAG(BRANCH) OVER (ORDER BY SPI DESC) AS PRE_BRANCH
			FROM STUDENT
		) AS T
	WHERE BRANCH = PRE_BRANCH;

--20. Display students whose SPI difference with previous student is maximum.
	SELECT *
	FROM (
			SELECT * , 
			SPI-LAG(SPI)
			OVER (ORDER BY SPI ) AS DIFF_SPI
			FROM STUDENT
		) AS T   
	WHERE DIFF_SPI = (
					SELECT MAX(DIFF_SPI2)
					FROM (
						SELECT  
						SPI-LAG(SPI)
						OVER (ORDER BY SPI ) AS DIFF_SPI2
						FROM STUDENT
					) AS U );   