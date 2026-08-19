CREATE TABLE ONLINE_CUSTOMER (
    CID INT PRIMARY KEY,
    NAME VARCHAR(30),
    CITY VARCHAR(30)
);

INSERT INTO ONLINE_CUSTOMER VALUES
(101,'RAHUL','RAJKOT'),
(103,'PTIYA','SURAT'),
(106,'DHARMIK','SURAT'),
(107,'MEHUL','MORBI');

CREATE TABLE OFFLINE_CUSTOMER (
    CID INT PRIMARY KEY,
    NAME VARCHAR(30),
    CITY VARCHAR(30)
);

INSERT INTO OFFLINE_CUSTOMER VALUES
(102,'AMIT','AHMEDABAD'),
(104,'HETVI','BARODA'),
(105,'RIYA','RAJKOT'),
(106,'DHARMIK','SURAT');

CREATE TABLE CUSTOMER (
    CID INT PRIMARY KEY,
    NAME VARCHAR(30),
    CITY VARCHAR(30),
    MEMBERSHIP VARCHAR(20)
);

INSERT INTO CUSTOMER VALUES
(101,'RAHUL','RAJKOT','GOLD'),
(102,'AMIT','AHMEDABAD','SILVER'),
(103,'PTIYA','SURAT','GOLD'),
(104,'HETVI','BARODA','PLATINUM'),
(105,'RIYA','RAJKOT','SILVER'),
(106,'DHARMIK','SURAT','GOLD'),
(108,'ISHITA','RAJKOT','GOLD'); 


--From the above table perform the following queries:  

--Part – A: 

--1. Display all unique customer names from ONLINE_CUSTOMER and OFFLINE_CUSTOMER. 
    SELECT NAME FROM ONLINE_CUSTOMER
    UNION 
    SELECT NAME FROM OFFLINE_CUSTOMER

--2. Display all unique customer cities from ONLINE_CUSTOMER and OFFLINE_CUSTOMER. 
    SELECT CITY FROM ONLINE_CUSTOMER
    UNION 
    SELECT CITY FROM OFFLINE_CUSTOMER

--3. Display duplicate customer names from both tables ONLINE_CUSTOMER and OFFLINE_CUSTOMER. 
    SELECT NAME FROM ONLINE_CUSTOMER
    INTERSECT 
    SELECT NAME FROM OFFLINE_CUSTOMER
    
--4. Display unique customer IDs from both tables. 
    SELECT CID FROM ONLINE_CUSTOMER
    UNION 
    SELECT CID FROM OFFLINE_CUSTOMER

--5. Display all GOLD membership customer names and online customer names using UNION.
    SELECT NAME FROM CUSTOMER
    WHERE MEMBERSHIP = 'GOLD'
    UNION
    SELECT NAME FROM ONLINE_CUSTOMER

--6. Display all customer names from CUSTOMER and ONLINE_CUSTOMER using UNION.  
    SELECT NAME FROM CUSTOMER
    UNION
    SELECT NAME FROM ONLINE_CUSTOMER

--7. Display all cities from CUSTOMER and OFFLINE_CUSTOMER using UNION.
    SELECT CITY FROM CUSTOMER
    UNION
    SELECT CITY FROM OFFLINE_CUSTOMER

--8. Display all customer IDs from CUSTOMER and OFFLINE_CUSTOMER using UNION ALL.
    SELECT CID FROM CUSTOMER
    UNION ALL
    SELECT CID FROM OFFLINE_CUSTOMER

--9. Display all customer names from RAJKOT city using UNION.
    SELECT NAME FROM ONLINE_CUSTOMER
    WHERE CITY = 'RAJKOT'
    UNION 
    SELECT NAME FROM OFFLINE_CUSTOMER
    WHERE CITY = 'RAJKOT'
    UNION
    SELECT NAME FROM CUSTOMER
    WHERE CITY = 'RAJKOT'

--10. Display all customer names starting with R from both tables using UNION.
    SELECT NAME FROM ONLINE_CUSTOMER
    WHERE NAME LIKE 'R%'
    UNION 
    SELECT NAME FROM OFFLINE_CUSTOMER
    WHERE NAME LIKE 'R%'
    
--11. Display customers who are both ONLINE and OFFLINE. 
    SELECT NAME FROM ONLINE_CUSTOMER
    INTERSECT 
    SELECT NAME FROM OFFLINE_CUSTOMER

--12. Display customer IDs existing in both ONLINE_CUSTOMER and OFFLINE_CUSTOMER. 
    SELECT CID FROM ONLINE_CUSTOMER
    INTERSECT 
    SELECT CID FROM OFFLINE_CUSTOMER

--13. Display customer names existing only in ONLINE_CUSTOMER.
    SELECT NAME FROM ONLINE_CUSTOMER
    EXCEPT
    SELECT NAME FROM OFFLINE_CUSTOMER

--14. Display customer names existing only in OFFLINE_CUSTOMER.
    SELECT NAME FROM OFFLINE_CUSTOMER
    EXCEPT
    SELECT NAME FROM ONLINE_CUSTOMER

--15. Display cities available in both ONLINE_CUSTOMER and OFFLINE_CUSTOMER. 
    SELECT CITY FROM ONLINE_CUSTOMER
    INTERSECT 
    SELECT CITY FROM OFFLINE_CUSTOMER


--Part – B: 

--16. Display customer names who are GOLD members and online customers. 
    SELECT NAME FROM CUSTOMER
    WHERE MEMBERSHIP = 'GOLD'
    INTERSECT
    SELECT NAME FROM ONLINE_CUSTOMER

--17. Display customer names who are PLATINUM members but not online customers.
    SELECT NAME FROM CUSTOMER
    WHERE MEMBERSHIP = 'PLATINUM'
    EXCEPT
    SELECT NAME FROM ONLINE_CUSTOMER

--18. Display customer IDs who are online customers but not offline customers. 
    SELECT CID FROM ONLINE_CUSTOMER
    EXCEPT
    SELECT CID FROM OFFLINE_CUSTOMER

--19. Display customer IDs who are offline customers but not online customers. 
    SELECT CID FROM OFFLINE_CUSTOMER
    EXCEPT
    SELECT CID FROM ONLINE_CUSTOMER

--20. Display customers who are present in CUSTOMER table but not in ONLINE_CUSTOMER.
    SELECT CID,NAME FROM CUSTOMER
    EXCEPT
    SELECT CID,NAME FROM ONLINE_CUSTOMER

--21. Display customers who are both GOLD members and available in OFFLINE_CUSTOMER. 
    SELECT NAME FROM CUSTOMER
    WHERE MEMBERSHIP = 'GOLD'
    INTERSECT
    SELECT NAME FROM OFFLINE_CUSTOMER

--22. Display all distinct cities from all three tables.
    SELECT CITY FROM CUSTOMER
    UNION
    SELECT CITY FROM ONLINE_CUSTOMER
    UNION
    SELECT CITY FROM OFFLINE_CUSTOMER

--23. Display customers who are online customers and belong to SURAT city using INTERSECT. 
    SELECT NAME FROM ONLINE_CUSTOMER
    INTERSECT
    SELECT NAME FROM ONLINE_CUSTOMER
    WHERE CITY = 'SURAT'

--24. Display customers who are offline customers but not from RAJKOT city using MINUS. 
    SELECT NAME FROM OFFLINE_CUSTOMER
    MINUS
    SELECT NAME FROM OFFLINE_CUSTOMER
    WHERE CITY != 'RAJKOT'

    --THIS IS ANOTHER WAY FOR ABOVE QUESTION

    --SELECT NAME FROM OFFLINE_CUSTOMER
    --EXCEPT
    --SELECT NAME FROM OFFLINE_CUSTOMER
    --WHERE CITY != 'RAJKOT' 

--25. Display customers who are GOLD members, online customers, and from SURAT city using INTERSECT. 
    SELECT NAME FROM CUSTOMER
    WHERE MEMBERSHIP = 'GOLD'
    INTERSECT
    SELECT NAME FROM ONLINE_CUSTOMER
    WHERE CITY = 'SURAT'

--Part – C: 


--26. Display customer names who are present in at least two tables.
    (   SELECT NAME FROM CUSTOMER
        INTERSECT  
        SELECT NAME FROM ONLINE_CUSTOMER  )
    UNION
    (   SELECT NAME FROM CUSTOMER
        INTERSECT  
        SELECT NAME FROM OFFLINE_CUSTOMER  )
    UNION
    (   SELECT NAME FROM OFFLINE_CUSTOMER
        INTERSECT  
        SELECT NAME FROM ONLINE_CUSTOMER )

--27. Display all customer names from CUSTOMER table excluding customers available in both ONLINE_CUSTOMER and OFFLINE_CUSTOMER.
    SELECT NAME FROM CUSTOMER
    EXCEPT
    (   SELECT NAME FROM ONLINE_CUSTOMER
        INTERSECT 
        SELECT NAME FROM OFFLINE_CUSTOMER )

--28. Display customer names who are present in both ONLINE_CUSTOMER and OFFLINE_CUSTOMER but not PLATINIUM members.
   SELECT NAME FROM ONLINE_CUSTOMER
   INTERSECT 
   SELECT NAME FROM OFFLINE_CUSTOMER
   EXCEPT
   (    SELECT NAME FROM CUSTOMER
        WHERE MEMBERSHIP = 'PLATINIUM' )
    
--29. Display customer names who are either online or offline but not both.
    (   SELECT NAME FROM ONLINE_CUSTOMER
        EXCEPT
        SELECT NAME FROM OFFLINE_CUSTOMER )
    UNION
    (   SELECT NAME FROM OFFLINE_CUSTOMER
        EXCEPT
        SELECT NAME FROM ONLINE_CUSTOMER )
    
--30. Display customer IDs present in CUSTOMER table but missing from both ONLINE_CUSTOMER and OFFLINE_CUSTOMER.
    SELECT CID FROM CUSTOMER
    EXCEPT
    (   SELECT CID FROM ONLINE_CUSTOMER
        UNION
        SELECT CID FROM OFFLINE_CUSTOMER )

