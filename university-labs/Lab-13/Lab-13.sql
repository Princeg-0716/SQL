--Part – A: 
--1. Combine information from Student and Result table using cross join (Cartesian product). 
	SELECT * FROM STUDENT_INFO  CROSS JOIN RESULT 
	

--2. Perform inner join on Student and Result tables.
	SELECT *
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO

--3. Perform the left outer join on Student and Result tables.
	SELECT * 
	FROM STUDENT_INFO S
	LEFT JOIN RESULT R
	ON S.RNO=R.RNO

--4. Perform the right outer join on Student and Result tables.
	SELECT * 
	FROM STUDENT_INFO S 
	RIGHT JOIN RESULT R
	ON S.RNO=R.RNO

--5. Perform the full outer join on Student and Result tables. 
	SELECT * 
	FROM STUDENT_INFO S
	FULL OUTER JOIN RESULT R
	ON S.RNO=R.RNO

--6. Display Rno, Name, Branch and SPI of all students. 
	SELECT R.RNO,NAME,BRANCH,SPI 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO

--7. Display Rno, Name, Branch and SPI of CE branch students only. 
	SELECT R.RNO,NAME,BRANCH,SPI 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE BRANCH='CE'

--8. Display Rno, Name, Branch and SPI of students other than EC branch. 
	SELECT R.RNO,NAME,BRANCH,SPI 
	FROM STUDENT_INFO S
	FULL OUTER JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE BRANCH='EC'

--9. Display Rno, Name and SPI of students whose SPI is greater than 8. 
	SELECT R.RNO,NAME,BRANCH,SPI 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE SPI>8

--10. Display Rno, Name and Branch of students whose SPI is less than 8. 
	SELECT R.RNO,NAME,BRANCH,SPI 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE SPI<8

--11. Display average result of each branch. 
	SELECT BRANCH,AVG(SPI)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	GROUP BY BRANCH
	
--12. Display average result of CE and ME branch. 
	SELECT BRANCH,AVG(SPI)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE BRANCH IN ('CE','ME')
	GROUP BY BRANCH
	
--13. Display maximum and minimum SPI of each branch. 
	SELECT BRANCH,MAX(SPI) AS MAX,MIN(SPI) AS MIN
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	GROUP BY BRANCH

--14. Display branch-wise student count in descending order.
	SELECT BRANCH,COUNT(S.RNO) AS TOTAL
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	GROUP BY BRANCH
	ORDER BY TOTAL DESC

--15. Display branch-wise total SPI of students. 
	SELECT BRANCH,SUM(SPI) AS TOTAL
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	GROUP BY BRANCH

--Part – B: 
--16. Display branch-wise number of students having SPI greater than 8.
	SELECT BRANCH,COUNT(R.RNO) 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE SPI > 8
	GROUP BY BRANCH

--17. Display branch-wise number of students having SPI less than 8.
	SELECT BRANCH,COUNT(R.RNO) 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	WHERE SPI < 8
	GROUP BY BRANCH

--18. Display branch-wise average SPI greater than 7. 
	SELECT BRANCH,AVG(SPI) 
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	GROUP BY BRANCH
	HAVING AVG(SPI) > 7

--19. Display branches having more than 1 students.
	SELECT BRANCH,COUNT(R.RNO)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO=R.RNO
	GROUP BY BRANCH
	HAVING COUNT(R.RNO) > 1

--20. Display branches where maximum SPI is greater than 9.
	SELECT BRANCH,MAX(SPI) AS MAX
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO
	GROUP BY BRANCH
	HAVING MAX(SPI) > 9

 
--Part – C: 
--21. Display average result of each branch and sort them in ascending order by SPI.
	SELECT BRANCH,AVG(SPI)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO
	GROUP BY BRANCH
	ORDER BY AVG(SPI)

--22. Display highest SPI from each branch and sort them in descending order.
	SELECT BRANCH,MAX(SPI)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO
	GROUP BY BRANCH
	ORDER BY MAX(SPI) DESC

--23. Display average result of each branch and sort them in descending order by SPI.
	SELECT BRANCH,AVG(SPI)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO
	GROUP BY BRANCH
	ORDER BY AVG(SPI) DESC

--24. Display highest SPI from each branch and sort them in ascending order. 
	SELECT BRANCH,MAX(SPI)
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO
	GROUP BY BRANCH
	ORDER BY MAX(SPI)

--25. Display branches where difference between max and min SPI is greater than 1.
	SELECT BRANCH,(MAX(SPI)-MIN(SPI))
	FROM STUDENT_INFO S
	JOIN RESULT R
	ON S.RNO = R.RNO
	GROUP BY BRANCH
	HAVING (MAX(SPI)-MIN(SPI)) > 1
