SELECT distinct S.playerID, AVG(IF(AP.awardID = "MVP",S.salary,null))

FROM Salaries S
LEFT JOIN AwardsPlayers AP ON S.playerID = AP.playerID

GROUP BY S.playerID


ORDER BY AVG(S.Salary) desc
;