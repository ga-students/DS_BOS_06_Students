SELECT m.*, a.awardID, COUNT(*) AS numWins FROM AwardsPlayers a
INNER JOIN (
    SELECT DISTINCT a1.playerID
    FROM AwardsPlayers a1
    INNER JOIN (
        SELECT DISTINCT playerID
        FROM AwardsPlayers
        WHERE awardID = 'MVP') a2
    ON a1.playerID = a2.playerID
    WHERE a1.awardID = 'Triple Crown') dw
ON a.playerID = dw.playerID
INNER JOIN Master m on a.playerID = m.playerID
WHERE a.awardID = 'MVP' OR a.awardID = 'Triple Crown'
GROUP BY a.playerID, a.awardID;