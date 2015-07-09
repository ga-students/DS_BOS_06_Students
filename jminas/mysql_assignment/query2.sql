#Calculate the number of MVPs and Triple Crown winners 
#by position ever in major league baseball - appearances

select f.POS, sum(if(p.awardID = "Triple Crown", 1, 0)) as TripleCrown, 
			  sum(if(p.awardID = "MVP", 1, 0)) as MVP
from AwardsPlayers p, Fielding f
where p.playerID = f.playerID #and p.awardID = "Triple Crown" 
group by f.POS

