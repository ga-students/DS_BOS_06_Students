SELECT distinct S.playerID, AVG(S.Salary), (AVG(S.salary)/5831211.94)

FROM Salaries S
LEFT JOIN AwardsPlayers AP ON S.playerID = AP.playerID

WHERE AP.awardID = "MVP"

GROUP BY S.playerID

ORDER BY AVG(S.Salary) desc
;