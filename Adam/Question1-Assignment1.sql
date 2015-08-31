Select m.nameLast, m.nameFirst, a.awardID, a.yearID, b.*, b.H/b.AB as BA
FROM AwardsPlayers a
INNER JOIN Master m ON a.playerID = m.playerID
INNER JOIN Batting b ON a.playerID = b.playerID AND a.yearID = b.yearID
WHERE a.awardID = 'Triple Crown'
ORDER BY battingAvg DESC, b.RBI DESC, b.HR DESC;