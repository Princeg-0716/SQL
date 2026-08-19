--Implement Advance Common Table Expressions (CTE) for Query Simplification 
-- From the table CUSTOMER perform the following queries:  
 
--CUSTOMER_ALL 

--ORDERID	CNAME	PRODUCT	CATEGORY	AMOUNT	ORDERYEAR	CITY 
--101		RAHUL	LAPTOP	ELECTRONICS	65000	2024		RAJKOT 
--102		PRIYA	MOBILE	ELECTRONICS	25000	2023		SURAT 
--103		AMIT	TABLE	FURNITURE	12000	2022		AHMEDABAD 
--104		NEHA	CHAIR	FURNITURE	8000	2024		BARODA 
--105		VISHAL	TV		ELECTRONICS 45000	2025		MORBI 
--106		RIYA	SOFA	FURNITURE	30000	2023		SURAT 
--107		MEHUL	AC		ELECTRONICS 40000	2022		RAJKOT 
--108		KRUNAL	BED		FURNITURE	40000	2025		JAMNAGAR 

CREATE TABLE CUSTOMER_ALL (
    ORDERID INT PRIMARY KEY,
    CNAME VARCHAR(50),
    PRODUCT VARCHAR(50),
    CATEGORY VARCHAR(50),
    AMOUNT INT,
    ORDERYEAR INT,
    CITY VARCHAR(50)
);

INSERT INTO CUSTOMER_ALL (ORDERID, CNAME, PRODUCT, CATEGORY, AMOUNT, ORDERYEAR, CITY)
VALUES (101, 'RAHUL', 'LAPTOP', 'ELECTRONICS', 65000, 2024, 'RAJKOT'),
(102, 'PRIYA', 'MOBILE', 'ELECTRONICS', 25000, 2023, 'SURAT'),
(103, 'AMIT', 'TABLE', 'FURNITURE', 12000, 2022, 'AHMEDABAD'),
(104, 'NEHA', 'CHAIR', 'FURNITURE', 8000, 2024, 'BARODA'),
(105, 'VISHAL', 'TV', 'ELECTRONICS', 45000, 2025, 'MORBI'),
(106, 'RIYA', 'SOFA', 'FURNITURE', 30000, 2023, 'SURAT'),
(107, 'MEHUL', 'AC', 'ELECTRONICS', 40000, 2022, 'RAJKOT'),
(108, 'KRUNAL', 'BED', 'FURNITURE', 40000, 2025, 'JAMNAGAR');

select * from CUSTOMER_ALL;

--Part – A: 

--1. Display top 3 highest amount orders.
    WITH TOP3_AMOUNT AS (	SELECT *,
							DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS D_R
							FROM CUSTOMER_ALL
							)

	SELECT * FROM TOP3_AMOUNT
	WHERE D_R <= 3;

--2. Display second highest order amount.
     WITH TOP2_AMOUNT AS (	SELECT *,
							DENSE_RANK() OVER(ORDER BY AMOUNT DESC) AS D_R
							FROM CUSTOMER_ALL
							)

	SELECT * FROM TOP2_AMOUNT
	WHERE D_R = 2;

--3. Display customers whose order amount is greater than category average amount.
	WITH AMOUNT_AVG AS (
						SELECT CATEGORY, AVG(AMOUNT) AS AVG_AMOUNT
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT C.*
	FROM CUSTOMER_ALL C
	JOIN AMOUNT_AVG A
	ON C.CATEGORY = A.CATEGORY
	WHERE C.AMOUNT > A.AVG_AMOUNT;

--4. Display categories having average amount greater than 30000.
	WITH AMOUNT_AVG AS (
						SELECT CATEGORY, AVG(AMOUNT) AS AVG_AMOUNT
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT * FROM AMOUNT_AVG 
	WHERE AVG_AMOUNT > 30000;

--5. Display highest amount order from each category.
	WITH HIGH_AMOUNT AS (
						SELECT CATEGORY, MAX(AMOUNT) AS MAX_AMOUNT
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT * FROM HIGH_AMOUNT; 

--6. Display lowest amount order from each category. 
	WITH LOW_AMOUNT AS (
						SELECT CATEGORY, MIN(AMOUNT) AS MIN_AMOUNT
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT * FROM LOW_AMOUNT; 

--7. Display categories having more than 3 orders.
	WITH ORDER_COUNT AS ( SELECT CATEGORY,COUNT(ORDERID) AS COUNT FROM CUSTOMER_ALL
							GROUP BY CATEGORY
							HAVING COUNT(ORDERID) > 3)

	SELECT * FROM ORDER_COUNT;

--8. Display city-wise total order amount.
	WITH ORDER_COUNT AS (	SELECT CITY,SUM(AMOUNT) AS TOTAL FROM CUSTOMER_ALL
							GROUP BY CITY )

	SELECT * FROM ORDER_COUNT;

--9. Display category having highest average order amount. 
	WITH RANK_AMOUNT AS (
						SELECT CATEGORY,AVG(AMOUNT) AS AVG_AMOUNT,
						RANK() OVER (ORDER BY AVG(AMOUNT) DESC) AS RN
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT * FROM RANK_AMOUNT
	WHERE RN = 1;

--10. Display cumulative order amount in ascending order of amount. 
	WITH AMOUNT_RANK AS (
					SELECT * ,
					RANK() OVER ( ORDER BY AMOUNT ) AS RANK
					FROM CUSTOMER_ALL )

	SELECT * FROM AMOUNT_RANK;

--Part – B: 

--11. Display category-wise top 2 highest amount orders.
	WITH RANK_AMOUNT AS (
						SELECT ORDERID,CATEGORY,AMOUNT AS AVG_AMOUNT,
						RANK() OVER (
									PARTITION BY CATEGORY
									ORDER BY AMOUNT DESC) AS RN
						FROM CUSTOMER_ALL )

	SELECT * FROM RANK_AMOUNT
	WHERE RN <= 2;

--12. Display customers whose amount is closest to category average amount.
	WITH CLOSET_AMOUNT AS (
							SELECT *,
							ABS(AMOUNT-AVG(AMOUNT) OVER (PARTITION BY CATEGORY) )AS DIFF FROM CUSTOMER_ALL )

	SELECT *
	FROM CLOSET_AMOUNT 
	WHERE DIFF IN 
	(
	SELECT MIN(DIFF)
	FROM CLOSET_AMOUNT
	GROUP BY CATEGORY
	)
	



--13. Display previous, current and next order amount together. 
	WITH AMOUNT AS (
					SELECT *,
					LAG(AMOUNT) OVER (ORDER BY ORDERID) AS 'PREVIOUS AMOUNT',
					AMOUNT AS 'CURRENT AMOUNT',
					LEAD(AMOUNT) OVER (ORDER BY ORDERID) AS 'NEXT AMOUNT'
					FROM CUSTOMER_ALL )

	SELECT * FROM AMOUNT;

--14. Display customers whose amount is greater than previous customer's amount. 
	WITH AMOUNT AS (
					SELECT ORDERID,
					LAG(AMOUNT) OVER (ORDER BY ORDERID) AS PRE_AMOUNT 
					FROM CUSTOMER_ALL )

	SELECT C.* 
	FROM CUSTOMER_ALL C
	JOIN AMOUNT A
	ON A.ORDERID = C.ORDERID
	WHERE C.AMOUNT > A.PRE_AMOUNT ;

--15. Display customers whose rank and dense rank are different.
	WITH RANK AS (
				SELECT *,
				RANK() OVER (ORDER BY AMOUNT) AS R,
				DENSE_RANK() OVER (ORDER BY AMOUNT) AS D 
				FROM CUSTOMER_ALL )

	SELECT * FROM RANK
	WHERE R <> D ;
	 
--Part – C: 
	
--16. Display orders whose amount is neither highest nor lowest in their category. 
	WITH AMOUNT AS (
						SELECT CATEGORY,
						MAX(AMOUNT) AS MAX,						
						MIN(AMOUNT) AS MIN
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT C.* 
	FROM CUSTOMER_ALL C
	JOIN AMOUNT A
	ON C.CATEGORY = A.CATEGORY
	WHERE C.AMOUNT NOT IN (A.MIN,A.MAX); 

--17. Display category-wise difference between highest and lowest amount.
	WITH AMOUNT_DIFF AS (
						SELECT CATEGORY,
						( MAX(AMOUNT) - MIN(AMOUNT) ) AS DIFF
						FROM CUSTOMER_ALL
						GROUP BY CATEGORY )

	SELECT * FROM AMOUNT_DIFF; 
	
--18. Display customers whose amount is greater than all FURNITURE category orders.
	WITH HIGH_AMOUNT AS (
						SELECT MAX(AMOUNT) AS MAX						
						FROM CUSTOMER_ALL
						WHERE CATEGORY = 'FURNITURE' )

	SELECT C.* 
	FROM CUSTOMER_ALL C
	CROSS JOIN HIGH_AMOUNT H
	WHERE C.AMOUNT > H.MAX; 

--19. Display categories where all orders are above 10000.
	WITH AMOUNT AS (
						SELECT CATEGORY, MIN(AMOUNT) AS MIN						
						FROM CUSTOMER_ALL
						GROUP BY  CATEGORY )

	SELECT CATEGORY FROM AMOUNT 
	WHERE MIN > 10000;
	
--20. Display customers whose amount difference from category topper is minimum.
	WITH CLOSET_AMOUNT AS (
							SELECT *,
							ABS(AMOUNT-MAX(AMOUNT) OVER (PARTITION BY CATEGORY) )AS DIFF FROM CUSTOMER_ALL )

	SELECT *
	FROM CLOSET_AMOUNT 
	WHERE DIFF IN (
					SELECT MIN(DIFF)
					FROM CLOSET_AMOUNT
					GROUP BY CATEGORY )  
	