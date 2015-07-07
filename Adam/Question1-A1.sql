Select nameLast, nameFirst, (H/AB) as BA, RBI, HR
From master, battingpost, awardsplayers
where (awardsplayers.playerID = battingpost.playerID and awardID = 'Triple Crown')
and battingpost.yearID = awardsplayers.yearID
order by BA, RBI, HR;