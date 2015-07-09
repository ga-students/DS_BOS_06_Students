Select teamID, count(allstarfull.teamID) as total 
FROM allstarfull
JOIN awardsplayers
ON awardsplayers.playerID = allstarfull.playerID
where (awardID = 'Most Valuable Player' or awardID = 'Triple Crown')
Group by teamID;