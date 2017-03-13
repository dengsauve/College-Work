/* Still need to code in batting leaders for BA, HR, RBI, OBP, and H */

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
	order by 'BA' desc;

select teamID as 'NAME',
	MAX(G) as 'GP',
	SUM(AB) as 'AB',
	SUM(R) as 'R',
	SUM(H) as 'H',
	SUM(B2) as '2B',
	SUM(B3) as '3B',
	SUM(HR) as 'HR',
	SUM(RBI) as 'RBI',
	(SUM(S)+(SUM(B2)*2)+(SUM(B3)*3)+(SUM(HR)*4)) as 'TB',
	SUM(BB) as 'BB',
	SUM(SO) as 'SO',
	SUM(SB) as 'SB',
	(SUM(H)*1.0)/(case when SUM(AB)=0 then 1 else SUM(AB) end) as 'BA',
	((SUM(H) + SUM(BB) + SUM(HBP))*1.0 / (case when (SUM(AB) + SUM(BB) + SUM(HBP))=0 then 1 else (SUM(AB) + SUM(BB) + SUM(HBP)) end)) as 'OBP',
	((SUM(S))+(SUM(B2)*2)+(SUM(B3)*3)+(SUM(HR)*4))*1.0 / (case when SUM(AB)=0 then 1 else SUM(AB) end) as 'SLG',
	((SUM(H) + SUM(BB) + SUM(HBP))*1.0 / (case when (SUM(AB) + SUM(BB) + SUM(HBP))=0 then 1 else (SUM(AB) + SUM(BB) + SUM(HBP)) end)) + 
		(((SUM(S))+(SUM(B2)*2)+(SUM(B3)*3)+(SUM(HR)*4))*1.0 / (case when SUM(AB)=0 then 1 else SUM(AB) end)) as 'OPS'
	from db_Baseball2015.vwPlayersBatting
	where yearID=2010 and teamID='LAN'
	group by teamID