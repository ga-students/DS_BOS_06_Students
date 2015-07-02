SELECT fielding.playerID, fielding.pos as position, awardsplayers.playerID 
FROM fielding
Join awardsplayers
on fielding.playerID=awardsplayers.playerID 
WHERE awardsplayers.awardID = 'Triple Crown' or awardsplayers.awardID ='Most Valuable Player'

 