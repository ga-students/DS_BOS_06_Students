#Calculate the average batting average, RBIs, and home runs by position ever in major league baseball. 
#Only consider seasons where a player had at least 300 at-bats (AB).

select f.POS, b.H/b.AB as avg, b.RBI, b.HR
from AwardsPlayers p, Fielding f, Batting b
where p.playerID = f.playerID and f.playerID = b.playerID and b.playerID = p.playerID and b.AB >= 300
group by f.POS
