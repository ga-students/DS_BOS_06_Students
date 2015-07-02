#Return all player info for all players that won an MVP and a Gold Glove 
#during their careers, along with the number of times they won each.

select  *,  sum(if(p.awardID = "Gold Glove", 1, 0)) as GoldGlove, 
			  sum(if(p.awardID = "MVP", 1, 0)) as MVP
from AwardsPlayers p, Master m, Batting b
where p.playerID = m.playerID 
group by p.playerID 
order by GoldGlove DESC, MVP DESC 