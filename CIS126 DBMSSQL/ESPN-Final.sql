select nameFirst + ' ' + nameLast as 'NAME',
	G as 'GP',
	AB,
	R,
	H,
	B2 as '2B',
	B3 as '3B',
	HR,
	RBI,
	((S)+(B2*2)+(B3*3)+(HR*4)) as 'TB',
	BB,
	SO,
	SB,
	(H*1.0)/(case when AB=0 then 1 else AB end) as 'BA',
	((H + BB + HBP)*1.0 / (case when (AB + BB + HBP)=0 then 1 else (AB + BB + HBP) end)) as 'OBP',
	((S)+(B2*2)+(B3*3)+(HR*4))*1.0 / (case when AB=0 then 1 else AB end) as 'SLG',
	((H + BB + HBP)*1.0 / (case when (AB + BB + HBP)=0 then 1 else (AB + BB + HBP) end)) + (((S)+(B2*2)+(B3*3)+(HR*4))*1.0 / (case when AB=0 then 1 else AB end)) as 'OPS'
	from db_Baseball2015.vwPlayersBatting
	where yearID=2010 and teamID='LAN'