/*  SQL Grouping Exercise
 * 	CIS DBMS SQL
 * 	Answer Boneyard
 */

/* #1 */

select * 
	from db_Baseball2015.vwPlayersBatting 
	order by nameLast, nameFirst
	
/* #2 */
	
select playerIDpk,
	nameFirst+' '+nameLast as 'Name',
	sum(HR) as 'Total Homeruns' 
	from db_Baseball2015.vwPlayersBatting
	inner join (select distinct playerID from db_Baseball2015.HallOfFame) as hof
	on playerIDpk = hof.playerID
	group by playerIDpk, nameFirst+' '+nameLast
	having sum(HR) > 500
	order by sum(HR) desc

/* #3 */

select nameLast,
	nameFirst,
	count(nameFirst + ' ' + nameLast) as 'Similar Names'
	from db_Baseball2015.Players
	group by nameFirst, nameLast
	having count(nameFirst + nameLast) > 1
	order by 'Similar Names' desc, nameLast, nameFirst
	
/* #4 */
	
select teamID 'Team',
	avg(weight) as 'Average Weight',
	avg(height) as 'Average Height',
	yearID 'Year'
	from db_Baseball2015.vwPlayersBatting
	group by teamID, yearID
	having yearID=1987
	order by teamID
	
/* #5 */
	
select top(5) teamID 'Team',
	avg(weight) as 'Average Weight'
	from db_Baseball2015.vwPlayersBatting
	group by teamID
	order by avg(weight) desc
	
/* #6 */
	
select teamID 'Team',
	yearID 'Year',
	avg(weight) as 'Average Weight',
	avg(height) as 'Average Height'
	from db_Baseball2015.vwPlayersBatting
	group by teamID, yearID
	having teamID = 'SEA'
	order by yearID
	
/* #7 */

select teamID 'Team',
	yearID 'Year',
	sum(HR) as 'Total Homeruns'
	from db_Baseball2015.vwPlayersBatting
	group by teamID, yearID
	order by teamID, yearID
	
/* #8 */
	
select nameFirst+' '+nameLast as 'Name',
	HR 'Homeruns',
	weight,
	yearID 'Year',
	finalGameDate 'Finale'
	from db_Baseball2015.vwPlayersBatting
	where finalGameDate = '2015-10-04 00:00:00'
	and weight < 180
	and HR > 20
	order by HR desc