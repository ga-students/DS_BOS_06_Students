SELECT mrn.mostRecentName,
SUM(CASE WHEN t.DivWin = 'Y' THEN 1 ELSE 0 END) AS divisionWins,
SUM(CASE WHEN t.LgWin = 'Y' THEN 1 ELSE 0 END) AS leagueWins,
SUM(CASE WHEN t.WSWin = 'Y' THEN 1 ELSE 0 END) AS worldSeriesWins
FROM Teams t
INNER JOIN (
    SELECT tt.teamID, tt.name AS mostRecentName
    FROM Teams tt
    INNER JOIN (
        SELECT MAX(ttt.yearID) AS lastYear, ttt.teamID
        FROM Teams ttt
        GROUP BY ttt.teamID) ly
    ON tt.teamID = ly.teamID AND tt.yearID=ly.lastYear) mrn
ON t.teamID = mrn.teamID
GROUP BY t.teamID