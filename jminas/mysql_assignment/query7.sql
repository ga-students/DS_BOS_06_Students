#Calculate the average salary (as a percentage of yearly average) of all MVPs 
#ever in major league baseball.

select avg(s.salary) as AvgSalary
from AwardsPlayers p, Salaries s
where p.awardID = "MVP" 