#Calculate the number of world series, division titles, and league championships for all teams.
#DivWin = Division Winner (Y or N)
#LgWin  = League Champion(Y or N)
#WSWin  = World Series Winner (Y or N)
select t.teamID, t.name,  sum(if(t.WSWin = "Y", 1, 0)) as WorldSeries, 
			  sum(if(t.DivWin = "Y", 1, 0)) as Division,
			  sum(if(t.LgWin = "Y", 1, 0)) as League
from Teams t
group by t.teamID 
Order by WorldSeries DESC, Division DESC, League DESC

