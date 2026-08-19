SELECT * FROM STUDENT
--Part – A: 
--1. Update SPI of all students from 7.00 to 8.00. 
	UPDATE STUDENT SET SPI=8.00
	WHERE SPI=7.00

--2. Change city of HETVI from RAJKOT to AHMEDABAD.
	UPDATE STUDENT SET CITY='AHMEDABAD'
	WHERE SNAME='HETVI' 

--3. Update SPI of DEEP to 9.20 and city to VADODARA.
	UPDATE STUDENT SET SPI=9.20,CITY='VADODARA'
	WHERE SNAME='DEEP'

--4. Update SPI of DHARMIK to 8.50. 
	UPDATE STUDENT SET SPI=8.50
	WHERE SNAME='DHARMIK'

--5. Update branch name from COMPUTER to IT. 
	UPDATE STUDENT SET BRANCH='IT'
	WHERE BRANCH='COMPUTER'

--6. Update branch of RAJ to AUTOMOBILE. 
	UPDATE STUDENT SET BRANCH='AUTOMOBILE'
	WHERE SNAME='RAJ'

--7. Update SPI to 7.50 where STDID is between 103 and 107. 
	UPDATE STUDENT SET SPI=7.50
	WHERE STDID BETWEEN 103 AND 107

--8. Update city of PARAG to MUMBAI.
	UPDATE STUDENT SET CITY='MUMBAI'
	WHERE SNAME='PARAG'

--9. Update SPI of RIYA to 6.00. 
	UPDATE STUDENT SET SPI=6.00
	WHERE SNAME='RIYA'

--10. Update SPI of SMAIR to 7.20 and branch to ELECTRICAL. 
	UPDATE STUDENT SET SPI=7.20,BRANCH='ELECTRICAL'
	WHERE SNAME='SMAIR'

--Part – B: 
--11. Give 10% increment in SPI.
	UPDATE STUDENT SET SPI=(SPI+SPI*0.1)

--12. Increase SPI by 20% for all students.  
	UPDATE STUDENT SET SPI=(SPI+SPI*0.2)
	
--13. Increase SPI by 0.50 in all records.
	UPDATE STUDENT SET SPI=(SPI+SPI*0.05)

--14. Update branch to 'EC' and SPI to 8.00 and city to Surat where SNAME is KRUNAL.
	UPDATE STUDENT SET BRANCH='EC',SPI=8.00,CITY='SURAT'
	WHERE SNAME='KRUNAL'

--15. Update city to 'RAJKOT' and SPI to 7.00 where branch is CIVIL and stdid is less than 105. 
	UPDATE STUDENT SET CITY='RAJKOT',SPI=7.00
	WHERE BRANCH='CIVIL' AND STDID>105

--Part – C: 
--16. Update SPI of student with stdid 110 to NULL. 
	UPDATE STUDENT SET SPI = NULL
	WHERE STDID=110

--17. Update branch of VISHAL to NULL.
	UPDATE STUDENT SET BRANCH = NULL

--18. Display names of students whose SPI is NULL.
	SELECT SNAME FROM STUDENT
	WHERE SPI IS NULL

--19. Display students who have branch assigned.
	SELECT SNAME FROM STUDENT
	WHERE NOT BRANCH IS NULL

--20. Update student with stdid 108 to name DARSHAN, branch COMPUTER, and SPI 8.50.  
	UPDATE STUDENT SET SNAME='DARSHAN',BRANCH='COMPUTER',SPI=8.50
	WHERE STDID=108

--21. Update city to SURAT where SPI is less than 7.00.
	UPDATE STUDENT SET CITY='SURAT'
	WHERE SPI>7.00

--22. Update city to NULL and branch to MECHANICAL where stdid is 109. 
	UPDATE STUDENT SET CITY=NULL,BRANCH='MECHANICAL'
	WHERE STDID=109

--EXTERA

--1. Update the SPI of all students with the name 'AMIT' to 8.20.
	UPDATE STUDENT SET SPI=8.20
	WHERE SNAME='AMIT'

-- 2. Change the city of PRIYA from 'MUMBAI' to 'PUNE'.
	UPDATE STUDENT SET CITY='PUNE'
	WHERE SNAME='PRIYA' AND CITY='MUMBAI'

-- 3. Update the SPI of HARSH to 7.80 and change his city to 'SURAT'.
	UPDATE STUDENT SET SPI=7.00,CITY='SURAT'
	WHERE SNAME='HARSH'

-- 4. Update the branch name from 'MECH' to 'MECHANICAL'.
	UPDATE STUDENT SET BRANCH='MECHANICAL'
	WHERE BRANCH='MECH'
	
-- 5. Change the branch of KAVYA to 'CIVIL'.
	UPDATE STUDENT SET BRANCH='CIVIL'
	WHERE SNAME='KAVYA'

-- 6. Update the SPI to 9.00 for all students whose STDID is between 110 and 115.
	UPDATE STUDENT SET SPI=9.00
	WHERE STDID BETWEEN 110 AND 115

-- 7. Update the city of AYUSH to 'BANGALORE'.
	UPDATE STUDENT SET CITY='BANGALORE'
	WHERE SNAME='AYUSH'

-- 8. Update the SPI of ANJALI to 8.40 and her branch to 'CHEMICAL'.
	UPDATE STUDENT SET SPI=8.40 , BRANCH='CHEMICAL'
	WHERE SNAME='ANJALI'

--9. Give a 5% increment in SPI to all students.
	UPDATE STUDENT SET SPI=(SPI+SPI*0.05)

-- 10. Increase the SPI by 15% only for students belonging to the 'IT' branch.
	UPDATE STUDENT SET SPI=(SPI+SPI*0.15)
	WHERE BRANCH='IT'

-- 11. Decrease the SPI by 0.20 for all students who live in 'VADODARA'.
	UPDATE STUDENT SET SPI=(SPI-0.20)
	WHERE CITY='VADODARA'

-- 12. Update the branch to 'MINING', SPI to 6.50, and city to 'JAIPUR' where the student's name is VIKRAM.
	UPDATE STUDENT SET BRANCH='MINING',SPI=6.50,CITY='JAIPUR'
	WHERE SNAME='VIKRAM'

-- 13. Update the city to 'RAJKOT' and SPI to 7.50 for all students whose branch is 'COMPUTER' and STDID is greater than 105.
	UPDATE STUDENT SET CITY='RAJKOT',SPI=7.50
	WHERE BRANCH='COMPUTER' AND STDID>105

-- 14. Deduct 10% from the SPI of any student whose current SPI is greater than 9.00.
	UPDATE STUDENT SET SPI=(SPI-SPI*0.1)
	WHERE SPI>9.00

--15. Update the SPI of the student with STDID 112 to NULL.
	UPDATE STUDENT SET SPI=NULL
	WHERE STDID=112

-- 16. Update the city of ROHAN to NULL.
	UPDATE STUDENT SET CITY=NULL
	WHERE SNAME='ROHAN'

-- 17. Display all details of students whose branch is NULL.
	SELECT * FROM STUDENT
	WHERE BRANCH IS NULL

-- 18. Display the names and cities of students who have an SPI assigned (is not NULL).
	SELECT SNAME,CITY FROM STUDENT
	WHERE SPI IS NOT NULL

-- 19. Update the student with STDID 105 to have the name 'MEET', branch 'EC', and SPI 7.90.
	UPDATE STUDENT SET SNAME='MEET',BRANCH='EC',SPI=7.90
	WHERE STDID=105

-- 20. Update the city to 'AHMEDABAD' and branch to 'DATA SCIENCE' for the student with STDID 120.
	UPDATE STUDENT SET CITY='AHMEDABAD',BRANCH='DATA SCIENCE'
	WHERE STDID=120
