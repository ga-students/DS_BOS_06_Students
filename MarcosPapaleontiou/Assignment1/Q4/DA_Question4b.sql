SELECT T.POS, AVG(T.BA) as BA, AVG(T.RBI) as RBI, AVG(T.HR) as HR

FROM

(SELECT F.POS, F.playerID,B.yearID,SUM(B.AB) as AB, (SUM(B.H)/SUM(B.AB)) as BA, AVG(B.RBI) as RBI, AVG(B.HR) as HR

FROM Fielding F
LEFT JOIN Batting B ON F.playerID = B.playerID



GROUP BY F.POS, F.playerID, B.yearID

HAVING AB > 300) T

GROUP BY T.POS

;