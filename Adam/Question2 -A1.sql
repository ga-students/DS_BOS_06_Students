Select fielding.pos as position, count(fielding.POS)  
FROM fielding
JOIN awardsplayers
ON awardsplayers.playerID = fielding.playerID
where (awardID = 'Most Valuable Player' or awardID = 'Triple Crown')
Group by position