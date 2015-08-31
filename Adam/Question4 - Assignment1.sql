SELECT AVG(b.H/b.AB) as avgAVG, AVG(b.RBI) as avgRBI, AVG(b.HR) as avgHR, CASE WHEN f.POS IN ('CF','LF','RF') THEN 'OF' ELSE f.POS END as position from Batting b
INNER JOIN Fielding f
ON b.playerID = f.playerID AND b.yearID = f.yearID
WHERE b.AB >= 300
GROUP BY position;