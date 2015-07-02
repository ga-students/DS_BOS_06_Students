#Calculate the number of MVPs and Triple Crown winners by team 
#ever in major league baseball.

select f.teamID, t.name,  sum(if(p.awardID = "Triple Crown", 1, 0)) as TripleCrown, 
			  sum(if(p.awardID = "MVP", 1, 0)) as MVP
from AwardsPlayers p, Fielding f, Teams t
where p.playerID = f.playerID and f.teamID = t.teamID #and p.awardID = "Triple Crown" 
group by f.teamID 
order by TripleCrown DESC
