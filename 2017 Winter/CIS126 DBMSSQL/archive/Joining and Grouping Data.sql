/* 1 */

select *
	from db_Baseball2015.Players
	inner join db_Baseball2015.Managers
	on playerIDpk = playerID

/* 2 */

create view db_Baseball2015.vwPlayerManagers as
	select *
	from db_Baseball2015.Players
	inner join db_Baseball2015.Managers
	on playerIDpk = playerID
	
/* 3 */
	
select nameLast+', '+nameFirst as 'Name',
	teamID as 'Team',
	sum(G) as 'Games Managed'
	from db_Baseball2015.vwPlayerManagers
	group by teamID, nameLast, nameFirst
	order by nameLast
	
/* 4 */
	
select nameLast+', '+nameFirst as 'Name',
	sum(W) as 'Wins',
	sum(L) as 'Losses'
	from db_Baseball2015.vwPlayerManagers
	group by nameLast, nameFirst
	having sum(w)>sum(L)
	order by nameLast
	
/* 5 */
	
select top(1) nameLast+', '+nameFirst as 'Name',
	sum(W) as 'Wins'
	from db_Baseball2015.vwPlayerManagers
	group by nameLast, nameFirst
	order by sum(w) desc

/* 6 */
	
select avg(W) as 'Wins',
	plyrMgr as 'PlayerManager'
	from db_Baseball2015.vwPlayerManagers
	group by plyrMgr
	
/* 7 */
	
select nameLast+', '+nameFirst as 'Manager',
	count(yearID) as 'Seasons Managed',
	teamID as 'Team Managed'
	from db_Baseball2015.vwPlayerManagers
	group by nameLast, nameFirst, teamID
	order by count(yearID) desc
	
/* 8 */
	
select nameLast+', '+nameFirst as 'Manager',
	count(yearID) as 'Seasons Managed'
	from db_Baseball2015.vwPlayerManagers
	group by nameLast, nameFirst
	order by count(yearID) desc
	
/* 9 */
	
select teamID as 'Team',
	count(distinct(playerID)) as 'Total Managers'
	from db_Baseball2015.vwPlayerManagers
	group by teamID
	order by count(PlayerID) desc
	
/* 10 */

select distinct nameLast+', '+nameFirst as 'Manager',
	height
	from db_Baseball2015.vwPlayerManagers
	where height is not null
	order by height
	
/* 11 */
select count(birthCountry)
	from db_Baseball2015.vwPlayerManagers
	where birthCountry<>'usa'
	
/* 12 */
	
create view db_Baseball2015.vwPlayerBatting as
	select * from db_Baseball2015.Players
	inner join db_Baseball2015.Batting
	on playerIDpk = playerID
	
/* 13 */
	
select sum(HR) as 'Total Homeruns',
	playerIDpk
	from db_Baseball2015.vwPlayerBatting
	group by playerIDpk
	order by sum(HR) desc

/* 14 */
	
select playerIDpk,
	avg(HR) as 'Average Homeruns',
	G as 'Games Played in Season'
	from db_Baseball2015.vwPlayerBatting
	group by playerIDpk, G
	having G>=20
	order by avg(HR) desc
	
/* 15 */
	
select playerIDpk,
	nameFirst+' '+nameLast,
	sum(B3) as 'Triples'
	from db_Baseball2015.vwPlayerBatting
	group by playerIDpk, nameFirst, nameLast
	order by SUM(B3) desc