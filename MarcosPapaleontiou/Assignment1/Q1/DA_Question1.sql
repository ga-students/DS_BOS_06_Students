select distinct M.playerID, M.nameFirst as First, M.nameLast as Last, (SUM(B.H)/SUM(B.AB)) as BA, SUM(B.RBI) as RBI, SUM(B.HR) as HR

from Batting B
left join Master M ON M.playerID = B.playerID
left join AwardsPlayers AP ON AP.playerID = M.playerID

where AP.awardID = "Triple Crown"
group by M.playerID
order by BA desc, RBI desc, HR desc
;