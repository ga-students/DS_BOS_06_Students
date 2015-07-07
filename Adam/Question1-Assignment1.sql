Select nameLast, nameFirst, (H/AB) as BA, RBI, HR, batting.yearID
From master, batting, awardsplayers
where (awardsplayers.playerID = batting.playerID and
awardsplayers.yearID = batting.yearID
and awardID = 'Triple Crown')
order by BA, RBI, HR;