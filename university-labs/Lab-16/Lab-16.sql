--From the table STADIUM, TEAM and PLAYER perform the following queries:  

--Part – A: 
	
--1. Display players who belong to teams located in ‘Mumbai’.
	SELECT  PLAYER_FIRST_NAME , PLAYER_LAST_NAME
	FROM STADIUM S
	JOIN TEAM T
	ON S.STADIUM_ID = T.HOME_STADIUM_ID
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	WHERE STADIUM_CITY = 'MUMBAI'

--2. Display all teams and players. 
	SELECT TEAM_NAME,PLAYER_FIRST_NAME,PLAYER_LAST_NAME
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	ORDER BY TEAM_NAME

--3. Display players along with team wins and stadium city. 
	SELECT PLAYER_FIRST_NAME,PLAYER_LAST_NAME,TEAM_WINS,STADIUM_CITY
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	JOIN STADIUM S
	ON S.STADIUM_ID = T.HOME_STADIUM_ID
	ORDER BY T.TEAM_ID

--4. Display team name and number of players in each team. 
	SELECT TEAM_NAME , COUNT (PLAYER_ID) AS PLAYER
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	GROUP BY TEAM_NAME

--5. Display team name, coach, and number of bowlers in each team. 
	SELECT TEAM_NAME ,TEAM_COACH, COUNT (PLAYER_ID) AS PLAYER
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	WHERE PLAYER_ROLE = 'BOWLER'
	GROUP BY TEAM_NAME,TEAM_COACH

--6. Display team name with count of batsmen, bowlers, and all-rounders.
	SELECT TEAM_NAME,
    COUNT(CASE WHEN PLAYER_ROLE = 'Batsman' THEN 1 END) AS batsman_count,
    COUNT(CASE WHEN PLAYER_ROLE = 'Bowler' THEN 1 END) AS bowler_count,
    COUNT(CASE WHEN PLAYER_ROLE = 'All-Rounder' THEN 1 END) AS all_rounder_count
	FROM PLAYER P
	JOIN TEAM T
	ON T.TEAM_ID = P.TEAM_ID
	GROUP BY TEAM_NAME;


--7. Display stadiums where teams have won more than 10 matches. 
	SELECT STADIUM_NAME
	FROM TEAM T
	JOIN STADIUM S
	ON S.STADIUM_ID = T.HOME_STADIUM_ID
	WHERE TEAM_WINS > 10
	GROUP BY STADIUM_NAME

--8. Display team name and number of players whose matches played is greater than 25. 
	SELECT TEAM_NAME,COUNT(PLAYER_ID) AS PLAYER
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID =  P.TEAM_ID
	WHERE PLAYER_MATCHES_PLAYED > 25
	GROUP BY TEAM_NAME

--9. Display team name and total number of players having jersey number greater than 30.
	SELECT TEAM_NAME,COUNT(PLAYER_ID) AS PLAYER
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID =  P.TEAM_ID
	WHERE PLAYER_JERSEY_NUMBER > 30
	GROUP BY TEAM_NAME

--10. Display team name and total matches played by its players. 
	SELECT TEAM_NAME,PLAYER_FIRST_NAME,PLAYER_LAST_NAME,PLAYER_MATCHES_PLAYED AS PLAYED_MATCHES
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID =  P.TEAM_ID
	GROUP BY TEAM_NAME,PLAYER_FIRST_NAME,PLAYER_LAST_NAME,PLAYER_MATCHES_PLAYED
 
--Part – B: 

--11. Display stadium city and total number of teams in each city. 
	SELECT STADIUM_CITY,COUNT(TEAM_ID) 
	FROM STADIUM S
	JOIN TEAM T
	ON T.HOME_STADIUM_ID =  S.STADIUM_ID
	GROUP BY STADIUM_CITY

--12. Display team name and average matches played by players in each team. 
	SELECT TEAM_NAME,AVG(PLAYER_MATCHES_PLAYED) 
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID =  P.TEAM_ID
	GROUP BY TEAM_NAME

--13. Display team name and maximum matches played by any player in each team.
	SELECT TEAM_NAME,MAX(PLAYER_MATCHES_PLAYED) 
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID =  P.TEAM_ID
	GROUP BY TEAM_NAME

--14. Display team name and minimum matches played by any player in each team.
	SELECT TEAM_NAME,MIN(PLAYER_MATCHES_PLAYED) 
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID =  P.TEAM_ID
	GROUP BY TEAM_NAME

--15. Display stadium name and total number of players playing under teams of that stadium. 
	SELECT STADIUM_NAME ,COUNT (PLAYER_ID)
	FROM STADIUM S
	JOIN TEAM T
	ON S.STADIUM_ID = T.HOME_STADIUM_ID
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	GROUP BY STADIUM_NAME


	select * from STADIUM
	select * from TEAM
	select * from PLAYER

--Part – C: 

--16. Display teams having more all-rounders than bowlers. 
	SELECT TEAM_NAME
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	GROUP BY TEAM_NAME
	HAVING COUNT(CASE WHEN PLAYER_ROLE = 'ALL-ROUNDER' THEN 1 END) > COUNT(CASE WHEN PLAYER_ROLE = 'BOWLER' THEN 1 END)

--17. Display teams where difference between max and min player matches is greater than 5. 
	SELECT TEAM_NAME
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	GROUP BY TEAM_NAME
	HAVING (MAX(PLAYER_MATCHES_PLAYED) -MIN(PLAYER_MATCHES_PLAYED)) > 5

--18. Display stadium city and total wins of teams in that city.
	SELECT STADIUM_CITY ,  SUM(TEAM_WINS)
	FROM STADIUM S
	JOIN TEAM T
	ON S.STADIUM_ID = T.HOME_STADIUM_ID
	GROUP BY STADIUM_CITY

--19. Display team name and total number of players for each role (grouped by role).
	SELECT TEAM_NAME ,PLAYER_ROLE, COUNT(PLAYER_ID)
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	GROUP BY TEAM_NAME , PLAYER_ROLE

--20. Display team name and total number of players whose name starts with ‘A’ 
	SELECT TEAM_NAME ,COUNT(PLAYER_ID)
	FROM TEAM T
	JOIN PLAYER P
	ON T.TEAM_ID = P.TEAM_ID
	WHERE PLAYER_FIRST_NAME LIKE 'A%'
	GROUP BY TEAM_NAME
