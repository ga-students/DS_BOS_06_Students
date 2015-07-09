#Find all of the Triple Crown (Award) winners ever in Major League Baseball, with:
#complete batting stats for the given year. 
#Order the results in descending order first by:
# 1.batting average, 
# 2.RBIs
# 3.Home runs

SELECT a.playerID, a.yearID, b.H/b.AB as avg, b.RBI, b.HR  FROM AwardsPlayers a, Batting b
WHERE a.playerID = b.playerID and a.awardID = "Triple Crown"
GROUP BY a.playerID ORDER BY avg DESC, b.RBI DESC, b.HR DESC




