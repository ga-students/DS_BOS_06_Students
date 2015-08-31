SELECT m.nameFirst, m.nameLast, a.yearID, s.salary, ys.avgSalary, s.salary / ys.avgSalary * 100 as percentOfAverageSalary from AwardsPlayers a
INNER JOIN Salaries s ON a.playerID = s.playerID AND a.yearID = s.yearID
INNER JOIN (
    SELECT yearID, AVG(salary) as avgSalary from Salaries
    GROUP BY yearID) ys
ON a.yearID = ys.yearID
LEFT JOIN Master m
ON a.playerID = m.playerID
WHERE awardID = 'MVP'