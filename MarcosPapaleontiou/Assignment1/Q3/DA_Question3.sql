select distinct T.name, 

count(distinct case when AP.awardID = "MVP" then AP.playerID else null end) as MVP, 
count(distinct case when AP.awardID = "Triple Crown" then AP.playerID else null end) as TripleCrown

FROM Fielding F
LEFT JOIN AwardsPlayers AP ON F.playerID = AP.playerID
LEFT JOIN Teams T ON F.teamID = T.teamID

WHERE AP.awardID = "MVP" or AP.awardID = "Triple Crown"
Group by F.teamID

;