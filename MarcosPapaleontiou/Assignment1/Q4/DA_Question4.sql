SELECT F.POS, AVG(B.RBI) as RBI, AVG(B.HR) as HR, (SUM(B.H)/SUM(B.AB)) as BA

FROM Fielding F
LEFT JOIN Batting B ON F.playerID = B.playerID

GROUP BY F.POS
;