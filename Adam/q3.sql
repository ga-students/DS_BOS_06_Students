SELECT fielding.playerID, fielding.teamID as team, awardsplayers.playerID 
FROM fielding
Join awardsplayers
on fielding.playerID=awardsplayers.playerID 
WHERE awardsplayers.awardID = 'Triple Crown' or awardsplayers.awardID ='Most Valuable Player'

 