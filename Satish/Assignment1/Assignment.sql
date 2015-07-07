#Q1. Find all of the Triple Crown (Award) winners ever in Major League Baseball, with their complete batting stats for the given year.
#Order the results in descending order first by batting average, then by RBIs, and lastly by home runs.
SELECT a.playerID,a.awardID,b.*
FROM AwardsPlayers a, Batting b
WHERE a.playerID = b.playerID
AND   a.yearID = b.yearID
AND   a.awardID = 'Triple Crown'
ORDER BY b.AB DESC ,b.RBI DESC ,b.HR DESC ;

#Q2. Calculate the number of MVPs and Triple Crown winners by position ever in major league baseball.
SELECT count(*),fp.POS as 'Position' from AwardsPlayers a,FieldingPost fp
WHERE
    a.playerID = fp.playerID
AND a.yearID = fp.yearID
AND a.awardID = 'Triple Crown' or a.awardID = 'MVP'
GROUP BY fp.POS;

#Q3. Calculate the number of MVPs and Triple Crown winners by team ever in major league baseball.
select b.teamID as 'Team',a.awardID as 'Award ',count(*) as 'No of Awards' from AwardsPlayers a,Batting b
where (a.playerID = b.playerID)
and (a.awardID = 'Triple Crown' or a.awardID = 'MVP')
GROUP BY b.teamID;


#Q4. Calculate the average batting average, RBIs, and home runs by position ever in major league baseball.
#Only consider seasons where a player had at least 300 at-bats (AB).
select fp.POS,avg(b.H/b.AB) as 'Batting Average',avg(b.RBI),avg(b.HR) from Batting b, FieldingPost fp
where b.playerID = fp.playerID
AND   b.yearID =fp.yearID
and   b.AB >= 300
GROUP BY fp.POS;


#Q5.Return all player info for all players that won an MVP and a Gold Glove during their careers, along with the number of times they won each.
SELECT X.playerID,X.awardID,X.`NUMBER OF AWARDS`,M.* FROM MASTER M,
    (SELECT a.playerID,a.awardID,count(*) AS "NUMBER OF AWARDS" from AwardsPlayers a
    where  a.awardID = 'MVP'

     UNION

     SELECT a.playerID,a.awardID,count(*) from AwardsPlayers a
     where  a.awardID = 'Gold Glove'

     GROUP BY a.awardID) X
WHERE M.playerID = X.playerID



#Q6. Calculate the number of world series, division titles, and league championships for all teams.
select T.teamID,SUM(IF(T.WSWin="Y",1,0)) AS "WS",SUM(IF(T.DivWin="Y",1,0)) AS DivWS,SUM(IF(T.LgWin="Y",1,0)) AS "Leage Wins" FROM Teams T
GROUP BY T.teamID;



#Q7Calculate the average salary (as a percentage of yearly average) of all MVPs ever in major league baseball.
select A.`MVP Average`,B.`Yearly Avg`,(A.`MVP Average`/B.`Yearly Avg`)*100 as "MVP AS YEARLY %",B.yearID from (SELECT AVG(s.salary) AS "MVP Average",a.playerID,s.yearID
               FROM AwardsPlayers a,Salaries s
               WHERE a.playerID = s.playerID
                     AND   a.yearID = s.yearID
                     and   a.awardID='MVP'
               GROUP BY a.playerID,s.yearID) A,(SELECT AVG(s.salary) as "Yearly Avg",s.yearID
                                                FROM Salaries s,AwardsPlayers a
                                                WHERE s.playerID = a.playerID
                                                GROUP BY s.yearID) B
WHERE A.yearID = B.yearID
GROUP BY A.yearID
ORDER BY B.yearID DESC;






