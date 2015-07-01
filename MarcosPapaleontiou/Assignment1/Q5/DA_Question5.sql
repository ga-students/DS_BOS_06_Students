SELECT M.playerID, M.nameFirst, M.nameLast, M.birthCity, 
SUM(IF(AP.awardID = "MVP",1,0)) as MVP, 
SUM(IF(AP.awardID = "Gold Glove",1,0)) as GoldGlove


FROM Master M
LEFT JOIN AwardsPlayers AP ON M.playerID = AP.playerID

GROUP BY M.playerID
ORDER BY MVP desc, GoldGlove desc
;